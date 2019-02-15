alias ll='ls -al'
alias mciskip='mvn clean install -DskipTests -Dmaven.clover.skip'
alias mciskipm='mvn clean install -Dmaven.clover.skip'
alias mci='mvn clean install'
alias mcu='mvn clean install -U'
alias mvntree='mvn dependency:tree'
alias mcrun='mvn spring-boot:run -Dspring.profiles.active=LOCAL'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
