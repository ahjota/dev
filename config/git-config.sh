#!/bin/sh

git config --global pull.rebase true
git config --global push.default current
if [ -x "$(command -v code)" ]; then
        git config --global core.editor "code --wait"
else
        git config --global core.editor vim
fi
