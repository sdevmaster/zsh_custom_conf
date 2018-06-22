# vim:ft=zsh ts=2 sw=2 sts=2

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}
function ssh_connection() {
	if [[ -n $SSH_CONNECTION ]]; then
		echo "%{$fg_bold[red]%}[ssh]"
	fi
}

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

MODE_INDICATED="%{$fg_bold[blue]%}"

function prompt_bottom_left_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATED}/(main|viins)/}"
}

RPS1='$(vi_mode_prompt_info)'

PROMPT='
┌─[ %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) ]%{$fg_bold[red]%}$(ssh_connection) %n@%m%  on %l %{$reset_color%} ⌚ %{$fg_bold[red]%}%*%{$reset_color%}
└─%{$fg_bold[red]%}$(prompt_bottom_left_info)[#%!][%?]$ >%{$reset_color%} '

