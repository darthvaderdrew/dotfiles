# ~/.bashrc

[[ $- != *i* ]] && return

if shopt -q progcomp && [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

# environment
path_dirs=(
    "$HOME/.local/bin"
    "$HOME/.local/share/nvim/mason/bin"
)
for d in "${path_dirs[@]}"; do
    if [[ -d "$d" ]] && ! [[ "$PATH" =~ "$d" ]]; then
        PATH="$d:$PATH"
    fi
done
unset d path_dirs
export PATH

export EDITOR="vim"
export PAGER="less"
export LESS="-FSRX"
export LESSHISTFILE=-

HISTCONTROL="ignoreboth"
HISTFILESIZE=-1
HISTSIZE=-1

shopt -s checkwinsize
shopt -s histappend

# prompt
for git_ps1_path in \
    /usr/share/git-core/contrib/completion/git-prompt.sh \
    /usr/share/git/git-prompt.sh \
    /usr/lib/git-core/git-sh-prompt; do
    if [[ -f "$git_ps1_path" ]]; then
        GIT_PS1_SHOWDIRTYSTATE=1
        source "$git_ps1_path"
        break
    fi
done

if ! declare -F __git_ps1 &>/dev/null; then
    echo "Warning: git-prompt.sh not found; git info will not be available."
fi

clr_red="\[$(tput setaf 1)\]"
clr_green="\[$(tput setaf 2)\]"
clr_yellow="\[$(tput setaf 3)\]"
clr_blue="\[$(tput setaf 4)\]"
clr_cyan="\[$(tput setaf 6)\]"
clr_gray="\[$(tput setaf 8)\]"
clr_bold="\[$(tput bold)\]"
clr_reset="\[$(tput sgr0)\]"

PROMPT_COMMAND='
[[ $? -eq 0 ]] && clr_arrow="${clr_green}" || clr_arrow="${clr_red}"
git_ps1_prompt="$(declare -F __git_ps1 &>/dev/null && __git_ps1 "|%s|" || :)"
PS1="${clr_blue}\t ${clr_gray}\u@\h ${clr_cyan}\w ${clr_yellow}${git_ps1_prompt}${clr_bold}${clr_arrow}→${clr_reset} "
'

# aliases and functions
alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
if [[ -f /usr/share/bash-completion/completions/git ]]; then
    source /usr/share/bash-completion/completions/git
    __git_complete dotfiles __git_main
fi

alias e="nvim"
alias c="clear"
alias l="ls -lha --color=auto"
alias l.="ls -d .* --color=auto"
alias ls="ls --color=auto"
alias la="ls -lhA --color=auto"
alias ll="ls -lAFh --color=auto"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -Iv"
alias df="df -h"
alias du="du -sh"
alias src='source $HOME/.bashrc'
alias free="free -h"
alias path='echo -e ${PATH//:/\\n}'
alias curl='curl -w "\n"'
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"
alias rmdir="rmdir -v"
alias which="type -a"

t(){ tmux new -As "${1:-main}"; }
