alias ll='ls -al'

# Z
# TODO How did you install Z?
. /usr/local/etc/profile.d/z.sh

# Git
alias g='git'

# Maven
alias mciskip='mvn clean install -DskipTests'
alias mci='mvn clean install'
alias mcu='mvn clean install -U'
alias mvntree='mvn dependency:tree'
alias mcrun='mvn spring-boot:run -Dspring.profiles.active=LOCAL'

# Docker
export DOCKER_BUILDKIT=1
alias d='docker'
alias doco='docker-compose'
alias docoreup='docker-compose down && docker-compose build && docker-compose up -d'

# Kubernetes
alias k='kubectl'
alias kcurrent='kubectl config current-context'

# Terraform
alias t='terraform'

# install https://github.com/nvbn/thefuck
eval $(thefuck --alias)

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
