FROM binhex/arch-int-gui:latest
LABEL org.opencontainers.image.authors="binhex"
LABEL org.opencontainers.image.source="https://github.com/binhex/arch-makemkv"

# release tag name from buildx arg
ARG RELEASETAG

# arch from buildx --platform, e.g. amd64
ARG TARGETARCH

# additional files
##################

# add install and packer bash script
ADD build/root/*.sh /root/

# add pre-configured config
ADD config/nobody/* /home/nobody/

# install app
#############

# make executable and run bash scripts to install app
RUN chmod +x /root/*.sh && \
	/bin/bash /root/install.sh "${RELEASETAG}" "${TARGETARCH}"

# healthcheck
#############

# ensure internet connectivity, used primarily when sharing network with other conainers
HEALTHCHECK --interval=1m --timeout=3s \
  CMD curl -s https://github.com &>/dev/null || kill 1

# set permissions
#################

# run script to set uid, gid and permissions
CMD ["/bin/bash", "init.sh"]
