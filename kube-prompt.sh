#!/bin/bash

# eval "$(starship init sh)"

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
  K8S_PROMPT_CLUSTER="$(kubectl config view --minify  --output 'jsonpath={..current-context}' 2> /dev/null)" 
  K8S_PROMPT_DIVIDER=":"
  K8S_PROMPT_NAMESPACE="$(kubectl config view --minify  --output 'jsonpath={..namespace}' 2> /dev/null)"
  K8S_PROMPT_SUFFIX=")"
  STEVEDORE_CONTEXT="$(stevedore config show-context 2>&1 | rg kubernetesContext | awk '{ print $2 }')"

	if [ -z $K8S_PROMPT_CLUSTER ]; then
		K8S_PROMPT_CLUSTER="no-context"
  fi

  K8S_PROMPT="$K8S_PROMPT_PREFIX${reset_color}"
  K8S_PROMPT+="${blue}stevedoreCtx:"
  K8S_PROMPT+="${yellow}$STEVEDORE_CONTEXT${reset_color}"
  K8S_PROMPT+="${reset_color}$K8S_PROMPT_SEPERATOR"
  K8S_PROMPT+="${blue}${K8S_PROMPT_LABEL}Ctx:"
  K8S_PROMPT+="${yellow}$K8S_PROMPT_CLUSTER${reset_color}"
  K8S_PROMPT+="${reset_color}$K8S_PROMPT_SEPERATOR"
  K8S_PROMPT+="$K8S_PROMPT_DIVIDER"
  if [ ! -z $K8S_PROMPT_NAMESPACE ]; then
    K8S_PROMPT+="${cyan}ns:$K8S_PROMPT_NAMESPACE${reset_color}"
  fi
  
  K8S_PROMPT+="$K8S_PROMPT_SUFFIX"
	terminal_prompt="${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)"
  echo "$terminal_prompt$K8S_PROMPT "

}
