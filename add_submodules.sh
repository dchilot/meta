#!/bin/sh

while read -r repo ; do git submodule add --name $repo https://github.com/orwell-int/$repo.git ; done < modules

#git submodule add https://github.com/dchilot/germs.git germs
#git submodule add https://github.com/google/googletest.git googletest
#mkdir -p deploy
#cd deploy
#ln -s ../capture-video .
#ln -s ../germs .
#cd -
#mkdir -p third_party
#cd third_party
#ln -s ../googletest
#cd -
