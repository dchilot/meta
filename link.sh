#!/bin/sh

for gitmodules in */.gitmodules ; do
	dir=$(dirname "$gitmodules")
	cd $dir
	pwd
	sed 's/\[submodule "\([^"]\+\)"\]/\1/p' -n .gitmodules
	for repo in $(sed 's/\[submodule "\([^"]\+\)"\]/\1/p' -n .gitmodules) ; do
		if [ -e "../$repo" ] ; then
			echo ln -s ../$repo .
		else
			echo "Not found: $repo" >&2
		fi
	done
	cd -
done
