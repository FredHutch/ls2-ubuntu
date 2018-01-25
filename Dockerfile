FROM ubuntu:16.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    ssl-cert

# These have reasonable defaults - only change if you really need to
ARG LS2_USERNAME=neo
ENV LS2_USERNAME=${LS2_USERNAME}
ARG LS2_GROUPNAME=neo
ENV LS2_GROUPNAME=${LS2_GROUPNAME}
ARG LS2_UID=500
ENV LS2_UID=${LS2_UID}
ARG LS2_GID=500
ENV LS2_GID=${LS2_GID}

# User for LS2 containers
RUN groupadd -g ${LS2_GID} ${LS2_GROUPNAME} && useradd -u ${LS2_UID} -g ${LS2_GROUPNAME} -ms /bin/bash ${LS2_USERNAME}

# switch to LS2 user for future actions
USER ${LS2_USERNAME}
WORKDIR /home/${LS2_USERNAME}
SHELL ["/bin/bash", "-c"]

# set up our directory for metadata
RUN mkdir /home/${LS2_USERNAME}/.ls2

# Generate a list of installed packages
RUN dpkg -l > .ls2/installed_pkgs
