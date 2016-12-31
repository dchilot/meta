#!/bin/sh

while read -r repo ; do git submodule add --name $repo https://github.com/orwell-int/$repo.git ; done < modules
