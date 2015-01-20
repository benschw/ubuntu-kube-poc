FROM ubuntu:14.04

MAINTAINER Ben Schwartz, https://github.com/benschw


ADD ./map.sh /opt/map.sh

VOLUME ["/opt/sites"]


# Launch apache when launching the container

ENTRYPOINT ["/bin/bash"]
CMD ["/opt/map.sh"]
