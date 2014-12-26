#! /usr/bin/env zsh
#-*- coding: utf-8 -*-
mkdir -p ~/ng/bin
for package in `ls /usr/local/opt`
do
    for filepath in `find $(brew --prefix $package)/bin -type f -print`
    do
        name=`basename $filepath`
        name=${name#g}
        ln -s $filepath ~/ng/bin/$name
    done
done
