#!/bin/bash

kube_prompt_colorize () {

  if [[ -n "${ZSH_VERSION-}" ]]; then
    blue="%F{blue}"
    reset_color="%f"
    red="%F{red}"
    cyan="%F{cyan}"
		yellow="%F{yellow}"
  else
    blue="\[\e[0;34m\]"
    reset_color="\[\e[0m\]"
    red="\[\e[0;31m\]"
    cyan="\[\e[0;36m\]"
  fi

}

kube_prompt () {

  # source our colors
  kube_prompt_colorize

  K8S_PROMPT_PREFIX="("
  K8S_PROMPT_LABEL="k8s"
  K8S_PROMPT_SEPERATOR="|"
  K8S_PROMPT_CLUSTER="$(kubectl config view --minify  --output 'jsonpath={..current-context}')"
  K8S_PROMPT_DIVIDER=":"
  K8S_PROMPT_NAMESPACE="$(kubectl config view --minify  --output 'jsonpath={..namespace}')"
  K8S_PROMPT_SUFFIX=")"

  K8S_PROMPT="$K8S_PROMPT_PREFIX${reset_color}"
  K8S_PROMPT+="${blue}$K8S_PROMPT_LABEL"
  K8S_PROMPT+="${reset_color}$K8S_PROMPT_SEPERATOR"
  K8S_PROMPT+="${yellow}$K8S_PROMPT_CLUSTER${reset_color}"
 # K8S_PROMPT+="$K8S_PROMPT_DIVIDER"
  K8S_PROMPT+="${cyan}$K8S_PROMPT_NAMESPACE${reset_color}"
  K8S_PROMPT+="$K8S_PROMPT_SUFFIX"
	terminal_prompt="${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)"
  echo "$terminal_prompt$K8S_PROMPT "

}
