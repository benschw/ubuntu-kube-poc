- (https://github.com/coreos/coreos-vagrant)
- (https://github.com/kelseyhightower/kubernetes-coreos/tree/v0.0.4)
- (https://github.com/GoogleCloudPlatform/kubernetes/tree/master/docs/getting-started-guides)
- (https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-kubernetes-on-top-of-a-coreos-cluster)

	kubecfg -c /vagrant/nginx/nginx-controller.json create replicationControllers
	kubecfg -c /vagrant/nginx/nginx-service.json create services

	# benschw/lamp-test
	kubecfg -c /vagrant/demo/lamp-test.json create /pods

	# https://dl.dropboxusercontent.com/u/1266213/kubernetes-linux-amd64.tar.gz

	docker run -d -p 80:80 -v /vagrant/sites:/etc/nginx/sites-enabled -v /vagrant/logs/nginx:/var/log/nginx dockerfile/nginx



	for kind in pods replicationControllers services; do kubecfg list ${kind}; done