#!/bin/bash

touch ~/.bashrc
rm ~/.bashrc

touch ~/.inputrc
rm ~/.inputrc

touch ~/.ssh/config
rm ~/.ssh/config

touch ~/.gitconfig
rm ~/.gitconfig

dir=$(dirname $(echo "$0"))

stow_folders=$(echo */)

cd $dir

for folder in $stow_folders
do
	stow --target ~ -S "$folder" 
done

