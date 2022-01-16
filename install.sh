#!/bin/bash

rm ~/.bashrc

dir=$(dirname $(echo "$0"))

stew_folders=$(echo */)

cd $dir
for folder in $stew_folders
do
	stow --target ~ -S $folder 
done
cd -
