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
shopt -s autocd

# prompt
for git_ps1_path in \
    /usr/share/git-core/contrib/completion/git-prompt.sh \
    /usr/share/git/git-prompt.sh \
    /usr/lib/git-core/git-sh-prompt; do
    if [[ -f "$git_ps1_path" ]]; then
        GIT_PS1_SHOWDIRTYSTATE=1
        source "$git_ps1_path"
        unset git_ps1_path
        break
    fi
done

if ! declare -F __git_ps1 &>/dev/null; then
    echo "Warning: git-prompt.sh not found; git info will not be available."
fi

__prompt_command() {
    local exit_status="$?"
    local git_ps1_prompt=""
    local arrow_color

    local clr_red="\[\e[31m\]"
    local clr_green="\[\e[32m\]"
    local clr_yellow="\[\e[33m\]"
    local clr_blue="\[\e[34m\]"
    local clr_cyan="\[\e[36m\]"
    local clr_gray="\[\e[37m\]"
    local clr_bold="\[\e[1m\]"
    local clr_reset="\[\e[0m\]"

    if [[ "$exit_status" -eq 0 ]]; then
        arrow_color="$clr_green"
    else
        arrow_color="$clr_red"
    fi

    if declare -F __git_ps1 &>/dev/null; then
        git_ps1_prompt="$(__git_ps1 "|%s|")"
    fi

    PS1="${clr_blue}\t ${clr_gray}\u@\h ${clr_cyan}\w ${clr_yellow}${git_ps1_prompt}${clr_bold}${arrow_color}→${clr_reset} "
}

PROMPT_COMMAND="__prompt_command"

# aliases and functions
alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
if [[ -f /usr/share/bash-completion/completions/git ]]; then
    source /usr/share/bash-completion/completions/git
    __git_complete dotfiles __git_main
fi

alias e='nvim'
alias c='clear'
alias l='ls -lha --color=auto'
alias l.='ls -d .* --color=auto'
alias ls='ls --color=auto'
alias la='ls -lhA --color=auto'
alias ll='ls -lAFh --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias df='df -h'
alias du='du -sh'
alias src='. ~/.bashrc'
alias free='free -h'
alias path='echo -e ${PATH//:/\\n}'
alias curl='curl -w "\n"'
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias rmdir='rmdir -v'
alias which='type -a'

t(){ tmux new -As "${1:-main}"; }
