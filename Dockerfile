FROM debian:testing-slim

RUN set -ex \
    && sed -i -- 's/# deb-src/deb-src/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
               build-essential \
               cdbs \
               devscripts \
               equivs \
               fakeroot \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/*

# App information
ENV app_name packaging-debian-testing
ENV app_version 0.1.0

# Container metadata
LABEL maintainer="ilmuflone"
LABEL maintainer_email="muflone@muflone.com"
LABEL app_name="Packaging Debian testing"
LABEL app_version="${app_version}"

ADD "build-helper.sh" "/build-packages"
CMD ["bash", "/build-packages"]

