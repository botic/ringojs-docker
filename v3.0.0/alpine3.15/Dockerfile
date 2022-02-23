FROM alpine:3.15

ENV DEBIAN_FRONTEND noninteractive
ENV RINGOJS_VERSION 3.0.0

# FIXME: drop the RC suffix with the release of 3.0.0
ENV RINGOJS_RC_VERSION -RC5

# FIXME: Add checksum check after release of 3.0.0
RUN addgroup -g 1000 ringojs \
  && adduser -u 1000 -G ringojs -s /bin/sh -D ringojs \
  && apk add --no-cache bash curl openjdk11 \
  && curl -fsSLO --compressed "https://github.com/ringo/ringojs/releases/download/v$RINGOJS_VERSION$RINGOJS_RC_VERSION/ringojs-$RINGOJS_VERSION$RINGOJS_RC_VERSION.tar.gz" \
  && tar -xzf ringojs-$RINGOJS_VERSION$RINGOJS_RC_VERSION.tar.gz \
  && rm ringojs-$RINGOJS_VERSION$RINGOJS_RC_VERSION.tar.gz \
  && mv ringojs-$RINGOJS_VERSION /usr/local/ \
  && ln -s /usr/local/ringojs-$RINGOJS_VERSION /usr/local/ringojs \
  && ln -s /usr/local/ringojs/bin/ringo /usr/local/bin/ringo \
  && ln -s /usr/local/ringojs/bin/ringo-admin /usr/local/bin/ringo-admin \
  && java --version \
  && ringo --version


COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "ringo" ]
