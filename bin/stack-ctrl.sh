#!/bin/bash

function reloadNginx() {
	/opt/bin/kubectl update -f /vagrant/nginx/nginx-controller.json
	/opt/bin/kubectl get -o json pods | \
		python /vagrant/bin/filters/container-id-by-name.py nginx | \
		xargs docker kill -s HUP
}

function reloadSitemapper() {
	/opt/bin/kubectl update -f /vagrant/nginx-site-mapper/sitemapper-controller.json
	/opt/bin/kubectl get -o json pods | \
		python /vagrant/bin/filters/pod-id-by-name.py sitemapper | \
		xargs /opt/bin/kubectl delete pods 
}

function reloadDemo() {
	/opt/bin/kubectl update -f /vagrant/demo/demo-service.json
	/opt/bin/kubectl update -f /vagrant/demo/demo-controller.json
	/opt/bin/kubectl get -o json pods | \
		python /vagrant/bin/filters/pod-id-by-name.py sitemapper | \
		xargs /opt/bin/kubectl delete pods 
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
	reload-sitemapper)
		reloadSitemapper "${ARGS[@]}";; # host, path, env, project, defaultLod
	reload-demo)
		reloadDemo "${ARGS[@]}";; # host, path, env, project, defaultLod
	*)
		usage
		exit 1
	;;
esac