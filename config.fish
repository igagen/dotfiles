status --is-interactive; and source (rbenv init -|psub)

alias s="git status"
alias d="git diff"
alias ds="git diff --staged"
alias dt="git difftool --no-symlinks --dir-diff"
alias dts="git difftool --no-symlinks --dir-diff --staged"
alias r="git reset"
alias a="git add -A"
alias lol="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias lola="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias b="git checkout -b"
alias c="git commit"
alias co="git checkout"
alias be="bundle exec"
alias v="nvim"
alias vf="nvim (fzf)"
alias vp="nvim (git ls-files | fzf)"
alias vh="nvim (find ~ | fzf)"

# OPAM configuration
# . /Users/igagen/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /Users/igagen/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.fish ]; and . /Users/igagen/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.fish