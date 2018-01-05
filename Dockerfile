FROM illallangi/ansible:latest
ENV PLEX_VERSION=1.11.0.4666-fc63598ba
ENV PLEX_SHA256=6238f67c8d066afc90e11c036a1b56425fe00b4b3976fc1fb9609a5777afe7da
COPY image/* /etc/ansible.d/image/
RUN /usr/local/bin/ansible-runner.sh image

ENV UID=1024
ENV USER=plex
COPY container/* /etc/ansible.d/container/
CMD ["/usr/local/bin/plex-entrypoint.sh"]
