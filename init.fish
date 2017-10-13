set -U fish_user_paths ~/.rbenv/bin ~/.yarn/bin $fish_user_paths
status --is-interactive; and source (rbenv init -|psub)

alias s="git status"
alias d="git diff"
alias ds="git diff --staged"
alias a="git add -A"
alias lol="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias lola="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias b="git checkout -b"
alias c="git commit"
alias co="git checkout"
alias be="bundle exec"
