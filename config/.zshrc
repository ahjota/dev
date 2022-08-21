# enable Zi, loading it if necessary
# ref: https://wiki.zshell.dev/docs/getting_started/installation#-minimal-configuration-with-loader
if [[ -r "/Users/aj/.config/zi/init.zsh" ]]; then
  source "/Users/aj/.config/zi/init.zsh" && zzinit
else
  #  TODO move to a bootstrap
  echo "zinit is not installed"
  sh -c "$(curl -fsSL https://git.io/get-zi)" -- -a loader
fi

# install OMZ libs
zi wait'!' lucid for \
  OMZL::clipboard.zsh \
  OMZL::functions.zsh \
  OMZL::misc.zsh

# install plugins

# OMZ MacOS
zi ice svn wait'!0' has'sw_vers'  # sw_vers is MacOS only
zi snippet OMZP::macos

# OMZ VSCode
zi ice has'code'  # code == Visual Studio Code
zi snippet OMZP::vscode

# install completions
zi wait lucid blockf
zi load zsh-users/zsh-completions

zi ice as"completion"
zi snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zi load unixorn/fzf-zsh-plugin

# User configuration
export WORKSPACE="$HOME/workspace"
export AJ_CONFIG="$WORKSPACE/aj/config"

# ZSH_THEME="robbyrussell"
# COMPLETION_WAITING_DOTS="true"
# plugins=(
#   history-substring-search
#   z
#   fzf
#   git
#   git-auto-fetch
#   brew
#   thefuck
#   encode64
#   ssh-agent
#   yarn
# )

# # User configuration
# export WORKSPACE="$HOME/workspace"

# function appendtopath() {
#   [[ :$PATH: == *":$1:"* ]] || PATH+=":$1"
# }

# function prependtopath() {
#   [[ :$PATH: == *":$1:"* ]] || PATH="$1:$PATH"
# }

# # n
# export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# # Yarn
# prependtopath $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

# # Go
# export GOROOT='/usr/local/go'
# prependtopath ${GOROOT}/bin
# [[ -e go ]] && appendtopath "$(go env GOPATH)/bin" || echo "Go is not installed"

# # thefuck
# eval $(thefuck --alias)

# # personal alias
# command kubectl >/dev/null 2>&1 && alias k=kubectl

# # if I have GNU tools brew-installed, add them to PATH
# # inspired by https://stackoverflow.com/a/23357277/914510
# # works with BSD find and GNU find
# while IFS=  read -r -d $'\0' GNUBIN; do
#     [[ :$PATH: == *":$GNUBIN:"* ]] || PATH="$GNUBIN:$PATH"
# done < <(find /usr/local/opt -type d -follow -name gnubin -print0)

# # vim keybindings in shell
# bindkey -v

# # for mtr to work
# # https://medium.com/macos-sh/mtr-my-traceroute-replacement-7827bd8efa42
# PATH=$PATH:/usr/local/sbin
