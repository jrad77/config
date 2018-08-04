local job_info="%{$fg[cyan]%}%(1j. [%{$fg[blue]%}%j%{$fg[cyan]%}].)"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}git:%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

# Depends on the git plugin for work_in_progress()

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# RVM component of prompt
ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_RVM_PROMPT_SUFFIX="]%{$reset_color%}"

# Combine it all into a final right-side prompt
RPS1='$(git_custom_status)$(ruby_prompt_info) $EPS1'

PROMPT='%{$fg[cyan]%}[%~% ]${job_info} %(?.%{$fg[green]%}.%{$fg[red]%})$ '
