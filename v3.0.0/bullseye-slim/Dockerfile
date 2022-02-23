FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND noninteractive
ENV RINGOJS_VERSION 3.0.0

# FIXME: drop the RC suffix with the release of 3.0.0
ENV RINGOJS_RC_VERSION -RC5

# FIXME: Add checksum check after release of 3.0.0
RUN groupadd --gid 1000 ringojs \
  && useradd --uid 1000 --gid ringojs --shell /bin/bash --create-home ringojs \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y curl default-jdk \
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
