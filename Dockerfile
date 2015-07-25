#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM registry:2.0.1
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN apt-get update && \
    apt-get install -y isc-dhcp-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ADD rootfs /

#------------------------------------------------------------------------------
# Entrypoint:
#------------------------------------------------------------------------------

ENTRYPOINT ["/init", "registry"]
CMD ["cmd/registry/config.yml"]
