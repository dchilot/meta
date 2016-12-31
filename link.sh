#!/bin/sh

for gitmodules in */.gitmodules ; do
	dir=$(dirname "$gitmodules")
	cd $dir
	pwd
	sed 's/\[submodule "\([^"]\+\)"\]/\1/p' -n .gitmodules
	for repo in $(sed 's/\[submodule "\([^"]\+\)"\]/\1/p' -n .gitmodules) ; do
		if [ -e "../$repo" ] ; then
			# this does not work because it changes the state of the local folder
			# there is apparently no easy way to make sure the repositories share
			# the same versions of modules
			if [ -d "$repo" ] ; then
				echo rm -rf "$repo"
			fi
			echo ln -s ../$repo .
		else
			echo "Not found: $repo" >&2
		fi
	done
	cd -
done
