- (https://github.com/coreos/coreos-vagrant)
- (https://github.com/kelseyhightower/kubernetes-coreos/tree/v0.0.4)
- (https://github.com/GoogleCloudPlatform/kubernetes/tree/master/docs/getting-started-guides)


	/opt/kubernetes/bin/kubecfg -c /vagrant/demo/lamp-test.json create /pods

	docker run -d -p 80:80 -v /vagrant/sites:/etc/nginx/sites-enabled -v /vagrant/logs/nginx:/var/log/nginx dockerfile/nginx