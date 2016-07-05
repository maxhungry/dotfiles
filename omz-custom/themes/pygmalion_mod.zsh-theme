# prompt modify from pygmalion

function ruby_version() {
  if which rbenv &> /dev/null; then
    rbenv version | sed -e "s/ (set.*$//"
  fi
}

prompt_setup_pygmalion(){
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="{$fg[green]%}?"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  # base_prompt='%{$fg[magenta]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%}%{$fg[red]%}:%{$reset_color%}%{$fg[cyan]%}%0~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}%{$fg[magenta]%}$(prompt_rvm)%{$fg[red]%}|'
  base_prompt="%{$fg[magenta]%}[%{$reset_color%}%{$fg[cyan]%}%0~%{$reset_color%}%{$reset_color%}%{$fg[magenta]%}] "
  post_prompt="%{$fg[cyan]%}⇒%{$reset_color%}  "

  base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")
  post_prompt_nocolor=$(echo "$post_prompt" | perl -pe "s/%\{[^}]+\}//g")

  precmd_functions+=(prompt_pygmalion_precmd)
}

prompt_pygmalion_precmd(){
  local gitinfo=$(git_prompt_info)
  local gitinfo_nocolor=$(echo "$gitinfo" | perl -pe "s/%\{[^}]+\}//g")
  local exp_nocolor="$(print -P \"$base_prompt_nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
  local prompt_length=${#exp_nocolor}

  local nl=""

  if [[ $prompt_length -gt 40 ]]; then
    nl=$'\n%{\r%}';
  fi
  PROMPT="$base_prompt$gitinfo$nl$post_prompt"
  # rvm_prompt="%{$fg[yellow]%}[ $(prompt_rvm) ]%{$reset_color%}"
  RPS1="%{$fg[yellow]%}[ $(ruby_version) ]%{$reset_color%}"
}

prompt_setup_pygmalion
