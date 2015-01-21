FROM ubuntu:14.04

MAINTAINER Ben Schwartz, https://github.com/benschw


ADD ./nginx-site-mapper /opt/nginx-site-mapper
ADD ./site.tpl /opt/site.tpl

VOLUME ["/opt/sites"]


# Launch apache when launching the container

ENTRYPOINT ["/opt/nginx-site-mapper"]
CMD ["-o", "/opt/sites/", "-t", "/opt/site.tpl"]
