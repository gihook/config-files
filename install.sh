#!/bin/bash

rm ~/.bashrc

stew_folders=$(echo */)

for folder in $stew_folders
do
	stow --target ~ -S $folder 
done
