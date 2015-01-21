server {
	listen      80; 
	server_name {{.Host}};

	location / {
		proxy_pass       http://{{.Ip}}:{{.Port}};

		proxy_set_header Host            $host;
		proxy_set_header X-Forwarded-For $remote_addr;

		index index.php index.html index.htm;
	}
}
