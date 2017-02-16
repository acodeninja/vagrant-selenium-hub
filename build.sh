#!/usr/bin/env bash

rm -f selenium-hub*.box

if packer build build.json ; then
    vagrant destroy -f
    vagrant box remove selenium-hub -f
    vagrant box add selenium-hub `ls selenium-hub*.box`
    vagrant up

    echo "Box successfully created: `pwd`/`ls selenium-hub*.box`"
else
    echo "Build failed"
fi
