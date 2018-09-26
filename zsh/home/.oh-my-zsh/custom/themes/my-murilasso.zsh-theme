local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}'
local git_branch='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}'
local root='%{$fg[red]%}# %{$reset_color%}'
local ssh_prefix="%{$terminfo[bold]$fg[red]%}ssh%{$reset_color%} "


PROMPT="${current_dir}${git_branch} "
RPS1="${return_code}"
if [[ $(print -P "%#") == '#' ]]; then
	PROMPT="$root$PROMPT"
fi

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  PROMPT="$ssh_prefix$PROMPT"
# many other tests omitted
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd)
      PROMPT="$ssh_prefix$PROMPT"
      ;;
  esac
fi


ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
