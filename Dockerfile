#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM registry:2.0.1
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | \
    debconf-set-selections && apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y dhcpcd5 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ADD rootfs /

#------------------------------------------------------------------------------
# Entrypoint:
#------------------------------------------------------------------------------

ENTRYPOINT ["/init", "registry"]
CMD ["cmd/registry/config.yml"]
