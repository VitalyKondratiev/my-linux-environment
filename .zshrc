# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
# End of lines configured by zsh-newuser-install

if [ -x "$(command -v git)" ]; then
    parse_git_branch() {
        [[ $(git rev-parse --show-toplevel 2> /dev/null) != $HOME ]] && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
fi

autoload -U colors && colors
setopt PROMPT_SUBST
PS1='%{$fg[green]%}%m@%n%{$fg[red]%}$ %{$fg[blue]%}%d %{$fg[magenta]%}$(parse_git_branch 2> /dev/null)%{$fg[yellow]%}>%{$reset_color%} '
