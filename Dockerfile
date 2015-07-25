#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM registry:2.0.1
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN sed -i 's/jessie/testing/' /etc/apt/sources.list && \
    echo "resolvconf resolvconf/linkify-resolvconf boolean false" | \
    debconf-set-selections && apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y isc-dhcp-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    sed -i 's/testing/jessie/' /etc/apt/sources.list

ADD rootfs /

#------------------------------------------------------------------------------
# Entrypoint:
#------------------------------------------------------------------------------

ENTRYPOINT ["/init", "registry"]
CMD ["cmd/registry/config.yml"]
