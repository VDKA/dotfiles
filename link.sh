#!/bin/bash

pushd $(dirname $0) > /dev/null
SCRIPTPATH=$(pwd)
popd > /dev/null

echo
for file in $(find -H $SCRIPTPATH/linked -mindepth 1 -maxdepth 1); do
	echo "linking $file"
	ln -sF $file $HOME/
done
echo

