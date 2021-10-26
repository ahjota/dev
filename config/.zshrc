ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(
  history-substring-search
  z
  fzf
  git
  git-auto-fetch
  osx
  brew
  thefuck
  vscode
  docker
  docker-compose
  encode64
  ssh-agent
  yarn
)

# User configuration
export WORKSPACE="$HOME/workspace"

function appendtopath() {
  [[ :$PATH: == *":$1:"* ]] || PATH+=":$1"
}

function prependtopath() {
  [[ :$PATH: == *":$1:"* ]] || PATH="$1:$PATH"
}

# n
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Yarn
prependtopath $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

# Go

export GOROOT='/usr/local/go'
prependtopath ${GOROOT}/bin
[[ -e go ]] && appendtopath "$(go env GOPATH)/bin" || echo "Go is not installed"

# thefuck
eval $(thefuck --alias)

# personal alias
command kubectl >/dev/null 2>&1 && alias k=kubectl

# open manpage in Preview
# TODO wonky if man errors out
pman() { man -t "$@" | open -f -a Preview || ; }

# if I have GNU tools brew-installed, add them to PATH
# inspired by https://stackoverflow.com/a/23357277/914510
# works with BSD find and GNU find
while IFS=  read -r -d $'\0' GNUBIN; do
    [[ :$PATH: == *":$GNUBIN:"* ]] || PATH="$GNUBIN:$PATH"
done < <(find /usr/local/opt -type d -follow -name gnubin -print0)

[ -f ~/workspace/aj/config/work/dr/.datarobot.zshrc ] && source ~/workspace/aj/config/work/dr/.datarobot.zshrc

# vim keybindings in shell
bindkey -v

# for mtr to work
# https://medium.com/macos-sh/mtr-my-traceroute-replacement-7827bd8efa42
PATH=$PATH:/usr/local/sbin
