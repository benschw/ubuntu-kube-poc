#!/bin/bash

function reloadNginx() {
	vagrant ssh -c "/opt/bin/kubecfg -json list pods | python /vagrant/bin/filters/container-id-by-name.py nginx | xargs sudo docker kill -s HUP"
}


function usage() {
	echo "Usage: `basename $0` <action>"
	echo "ex: `basename $0` reload-nginx"
}

ARGS=( "$@" )
unset ARGS[0]

case $1 in
	reload-nginx)
		reloadNginx "${ARGS[@]}";; # host, path, env, project, defaultLod
	*)
		usage
		exit 1
	;;
esac