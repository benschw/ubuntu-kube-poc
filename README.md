- (https://github.com/coreos/coreos-vagrant)
- (https://github.com/kelseyhightower/kubernetes-coreos/tree/v0.0.4)
- (https://github.com/GoogleCloudPlatform/kubernetes/tree/master/docs/getting-started-guides)
- (https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-kubernetes-on-top-of-a-coreos-cluster)

	# dockerfile/nginx
	kubectl create -f /vagrant/nginx/nginx-controller.json

	# benschw/lamp-test
	kubectl create -f /vagrant/demo/demo-controller.json
	kubectl create -f /vagrant/demo/demo-service.json

	# benschw/sitemapper
	kubectl create -f /vagrant/nginx-site-mapper/sitemapper-controller.json



	for kind in pods replicationControllers services; do echo; echo ${kind}:; kubectl get ${kind}; done




## misc
	docker run -d -p 80:80 -v /vagrant/sites:/etc/nginx/sites-enabled -v /vagrant/logs/nginx:/var/log/nginx dockerfile/nginx


	docker run -t -d -v /vagrant/tmp/:/opt/sites/ benschw/sitemapper

	./bin/kube.sh reload-nginx
	./bin/kube.sh reload-sitemapper


	docker pull benschw/lamp-test && docker pull dockerfile/nginx && docker pull benschw/sitemapper