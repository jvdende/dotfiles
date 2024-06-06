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
    python
    rails
    sudo
    tmux
    z
)

if   [[ "$OSTYPE" == "linux-gnu"* ]]; then
  plugins+=(ubuntu)
elif [[ "$OSTYPE" == "darwin"* ]]; then
  plugins+=(macos brew)
fi

source $ZSH/oh-my-zsh.sh

# Default editor
export VISUAL=$(which nvim)
export EDITOR=$VISUAL

# Fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --no-ignore-vcs --glob "!{.git,node_modules}"'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
