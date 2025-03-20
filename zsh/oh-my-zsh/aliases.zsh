# git
alias gpsupmr="git push --set-upstream origin $(git_current_branch) -o merge_request.create"
alias glr="git pull --rebase"

# overmind
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias overmind="/etc/overmind"
fi

alias ovm=overmind
