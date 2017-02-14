#!/usr/bin/env bash

if packer build build.json ; then
    vagrant destroy -f
    vagrant box remove selenium-hub -f
    vagrant box add selenium-hub selenium-hub.box
    vagrant up
else
    echo "Build failed"
fi
