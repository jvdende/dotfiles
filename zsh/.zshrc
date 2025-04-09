# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k" 

plugins=(
    bundler
    common-aliases
    docker
    docker-compose
    git
    git-auto-fetch
    mise
    npm
    python
    rails
    rust
    sudo
    tmux
    yarn
    z
)

if   [[ "$OSTYPE" == "linux-gnu"* ]]; then
  plugins+=(ubuntu)
elif [[ "$OSTYPE" == "darwin"* ]]; then
  plugins+=(macos)
fi

source $ZSH/oh-my-zsh.sh

# Default editor
export VISUAL=$(which nvim)
export EDITOR=$VISUAL

# aider
source "$HOME/.local/bin/env"

# Fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --no-ignore-vcs --glob "!{.git,node_modules}"'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# p10k: Fix for mise to use asdf segments
[[ -f ~/.oh-my-zsh/custom/prompt/p10k.mise.zsh ]] && source ~/.oh-my-zsh/custom/prompt/p10k.mise.zsh
