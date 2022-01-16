#!/bin/bash

rm ~/.bashrc

dir=$(dirname $(echo "$0"))

stow_folders=$(echo */)

cd $dir

for folder in $stow_folders
do
	stow --target ~ -S "$folder" 
done

