FROM resin/rpi-raspbian:latest
#OLD-MAINTAINER Ryan Schlesinger <ryan@ryanschlesinger.com>
MAINTAINER Lucas Zanella <me@lucaszanella.com>

RUN apt-get update -q -y \
    && apt-get install -q -y \
    oracle-java8-jdk \
    mongodb-server

# Install any version from deb download
# Use dpkg to mark the package for install (expect it to fail to complete the installation)
# Use apt-get install -f to complete the installation with dependencies
ENV UNIFI_VERSION 5.9.26-25460f7409
RUN apt-get update && apt-get install -y --no-install-recommends wget && \
      mkdir -p /tmp/build && \
      cd /tmp/build && \
      wget https://www.ubnt.com/downloads/unifi/${UNIFI_VERSION}/unifi_sysvinit_all.deb && \
      dpkg --install unifi_sysvinit_all.deb ; \
      apt-get install -f && \
      rm -rf /var/lib/apt/lists/* && \
      rm -rf /tmp/build

RUN ln -s /var/lib/unifi /usr/lib/unifi/data
EXPOSE 8080/tcp 8081/tcp 8443/tcp 8843/tcp 8880/tcp 3478/udp

WORKDIR /var/lib/unifi

ENTRYPOINT ["/usr/bin/java", "-Xmx512M", "-jar", "/usr/lib/unifi/lib/ace.jar"]
CMD ["start"]

