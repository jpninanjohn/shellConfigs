#!/bin/bash
set -e

echo "Setting up swap with args $@"
swap_memory=$(free|awk '/^Swap:/{print $2}')
phy_memory=$(free|awk '/^Mem:/{print $2}')
phy_memory=$((phy_memory/(1024*1024)))
num_cores=$(nproc)

get_swap(){
  memory=$1
  cores=$2
  per_core=$3
  
  if [[ $((memory/cores)) -lt 3 ]]; then
    echo $((cores*per_core))
  else
    echo $((memory+memory))
  fi
}

recommended_swap=$(get_swap phy_memory num_cores 5)
recommended_swap=$((recommended_swap*1024))

if [[ $# -eq 1 && $1 = true ]]; then
  echo 'Usage: bash setup_swap.sh true <swap_kB>'
  exit -1
fi

if [[ $# -gt 1 && $1 = true ]]; then
  if [ "$2" -eq "$2" ] 2>/dev/null; then
    recommended_swap=$2
  else
    echo 'Usage: bash setup_swap.sh true <swap_kB>'
    exit -1
  fi
fi

echo "Recommended swap $recommended_swap"
existing=$((100*(swap_memory/1024)/recommended_swap))
if [[ $existing -lt 90 ]]; then
  swapoff -a
  rm -rf /extraswap
  dd if=/dev/zero of=/extraswap bs=1M count=$recommended_swap
  mkswap /extraswap
  chmod 0600 /extraswap
fi