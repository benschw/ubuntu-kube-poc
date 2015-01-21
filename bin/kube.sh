#!/bin/bash

# proxy script to invoke ./stack-ctrl.sh from within the vagrant host with the same arguments

ARGS=( "$@" )

vagrant ssh -c "/vagrant/bin/stack-ctrl.sh ${ARGS[@]}"

