FROM alpine
ARG package
COPY ${package} /tmp/foo.apk
COPY keyfile/id_rsa.pub /etc/apk/keys/appuser@3b1a5e094ee4.rsa.pub
#RUN apk add /tmp/foo.apk
# TODO make this work without --allow-untrusted
RUN apk add --allow-untrusted /tmp/foo.apk
RUN test -e /usr/local/bin/fake
RUN test -f /etc/foo/whatever.conf
RUN echo wat >> /etc/foo/whatever.conf
RUN apk del foo
RUN test -f /etc/foo/whatever.conf
RUN test ! -f /usr/local/bin/fake
