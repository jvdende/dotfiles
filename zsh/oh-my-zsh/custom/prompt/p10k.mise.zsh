# Powerlevel10k prompt segments for mise
# [Feature request: add segment for mise](https://github.com/romkatv/powerlevel10k/issues/2212)
# Usage in ~/.zshrc:
#   [[ -f ~/.config/shell/p10k.mise.zsh ]] && source ~/.config/shell/p10k.mise.zsh

() {
  function prompt_mise() {
    local plugins=("${(@f)$(mise ls --current 2>/dev/null | awk '!/\(symlink\)/ && $3!="~/.tool-versions" && $3!="~/.config/mise/config.toml" {print $1, $2}')}")
    local plugin
    for plugin in ${(k)plugins}; do
      local parts=("${(@s/ /)plugin}")
      local tool=${(U)parts[1]}
      local version=${parts[2]}
      p10k segment -r -i "${tool}_ICON" -s $tool -t "$version"
    done
  }

  typeset -g POWERLEVEL9K_MISE_FOREGROUND=$POWERLEVEL9K_ASDF_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_RUBY_FOREGROUND=$POWERLEVEL9K_ASDF_RUBY_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_PYTHON_FOREGROUND=$POWERLEVEL9K_ASDF_PYTHON_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_GOLANG_FOREGROUND=$POWERLEVEL9K_ASDF_GOLANG_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_NODEJS_FOREGROUND=$POWERLEVEL9K_ASDF_NODEJS_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_RUST_FOREGROUND=$POWERLEVEL9K_ASDF_RUST_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_DOTNET_CORE_FOREGROUND=$POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_FLUTTER_FOREGROUND=$POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_LUA_FOREGROUND=$POWERLEVEL9K_ASDF_LUA_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_JAVA_FOREGROUND=$POWERLEVEL9K_ASDF_JAVA_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_PERL_FOREGROUND=$POWERLEVEL9K_ASDF_PERL_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_ERLANG_FOREGROUND=$POWERLEVEL9K_ASDF_ERLANG_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_ELIXIR_FOREGROUND=$POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_POSTGRES_FOREGROUND=$POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_PHP_FOREGROUND=$POWERLEVEL9K_ASDF_PHP_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_HASKELL_FOREGROUND=$POWERLEVEL9K_ASDF_HASKELL_FOREGROUND
  typeset -g POWERLEVEL9K_MISE_JULIA_FOREGROUND=$POWERLEVEL9K_ASDF_JULIA_FOREGROUND

  # Substitute the default asdf prompt element
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=("${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[@]/asdf/mise}")
}