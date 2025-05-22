#!/usr/bin/env bash

curl -L git.io/antigen > ~/.antigen.zsh

curl -fsSL https://gist.githubusercontent.com/supergeoff/0beee31eb794c5ef9780a7a143d2ccda/raw/d7fe200e2ec8d38f8de7ce5606e8ebee1a283abf/.zshrc.sh
mv ~/.zshrc.sh ~/.zshrc

pipx install shfmt-py # a shell formater

# Check if the explainshell container is running
if [ "$(docker ps -q -f name=explainshell)" ]; then
    # Stop the running container
    docker stop explainshell
    # Remove the container
    docker rm explainshell
fi

# Run a new explainshell container
# this will add hover annotations in shell script files, assuming mads-hartmann.bash-ide-vscod is installed
docker container run --name explainshell --restart always -p 5000:5000 -d spaceinvaderone/explainshell
