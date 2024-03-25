if [ "$AJ_CONFIG" ]; then return; fi

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(
  history-substring-search
  z
  fzf
  git
  git-auto-fetch
  macos
  brew
  thefuck
  vscode
  docker
  encode64
  ssh-agent
)

source $ZSH/oh-my-zsh.sh

# User configuration
export WORKSPACE="$HOME/workspace"
export AJ_CONFIG="$WORKSPACE/aj/config"

function appendtopath() {
  [[ :$PATH: == *":$1:"* ]] || PATH+=":$1"
}

function prependtopath() {
  [[ :$PATH: == *":$1:"* ]] || PATH="$1:$PATH"
}

function prependalltopath() {
  for var in $1
  do
    [ -d $var ] && prependtopath $var || echo $var does not exist
  done
}

# n
export N_PREFIX="$HOME/n"    # Added by n-install (see http://git.io/n-install-repo).
appendtopath $N_PREFIX/bin

# Yarn
#prependalltopath $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin

# Go
#export GOROOT='/usr/local/go'
#prependtopath ${GOROOT}/bin
[[ -e go ]] && appendtopath "$(go env GOPATH)/bin" || echo "Go is not installed"

# Python
alias mypydiff='git diff --staged --name-only | xargs mypy'

# thefuck
[[ -e thefuck ]] && eval $(thefuck --alias)

# personal alias
command -v kubectl >/dev/null && alias k=kubectl

# if I have GNU tools brew-installed, add them to PATH
# inspired by https://stackoverflow.com/a/23357277/914510
# works with BSD find and GNU find
# while IFS=  read -r -d $'\0' GNUBIN; do
#    [[ :$PATH: == *":$GNUBIN:"* ]] || PATH="$GNUBIN:$PATH"
# done < <(find /usr/local/opt -type d -follow -name gnubin -print0)
# TODO The above is way too slow
prependalltopath /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/gawk/libexec/gnubin /usr/local/opt/gsed/libexec/gnubin /usr/local/opt/gnu-sed/libexec/gnubin /usr/local/opt/grep/libexec/gnubin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/libtool/libexec/gnubin

[ -f ${AJ_CONFIG}/work/dr/.datarobot.zshrc ] && source ${AJ_CONFIG}/work/dr/.datarobot.zshrc

# vim keybindings in shell
bindkey -v

# for mtr to work
# https://medium.com/macos-sh/mtr-my-traceroute-replacement-7827bd8efa42
appendtopath /usr/local/sbin

if [[ $(command -v starship) ]] then
  export STARSHIP_CONFIG=${AJ_CONFIG}/starship.toml
  # You may still need to add this at the end of .zshrc for it to work
  eval "$(starship init zsh)"
fi
