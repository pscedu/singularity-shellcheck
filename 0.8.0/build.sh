#!/bin/bash

# Copyright © 2021 Pittsburgh Supercomputing Center.
# All Rights Reserved.

IMAGE=singularity-shellcheck-0.8.0.sif
DEFINITION=Singularity

if [ -f $IMAGE ]; then
	rm -fv $IMAGE
fi

wget https://github.com/koalaman/shellcheck/releases/download/v0.8.0/shellcheck-v0.8.0.linux.x86_64.tar.xz
tar -xf shellcheck-v0.8.0.linux.x86_64.tar.xz
rm -f shellcheck-v0.8.0.linux.x86_64.tar.xz
sudo singularity build $IMAGE $DEFINITION
rm -rf shellcheck-v0.8.0 

if [ -f $IMAGE ]; then
	exit 0
else
	exit 1
fi
