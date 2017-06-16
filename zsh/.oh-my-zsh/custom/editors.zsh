export EDITOR=vim
export BUNDLER_EDITOR=vim

alias vi='vim'
alias v='vim'
co() {
  if [ -z "$1" ]; then
    code $1
  else
    code .
  fi
}
