alias up="docker-compose up -t 0 --remove-orphans --force-recreate -d"
alias down="docker-compose down -t 0 --remove-orphans"
alias dkill="docker rm -f \$(docker ps -a -q)"
alias dlog="docker-compose logs -f"
alias dlogd="docker-compose logs"