
	sudo docker build -t benschw/lamp-test .
	sudo docker run -d -p 8000:80 -t benschw/lamp-test

	
	sudo docker run -i -t ubuntu /bin/bash
