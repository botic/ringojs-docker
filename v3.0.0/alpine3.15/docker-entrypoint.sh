#!/bin/sh
set -e

#
# See https://github.com/nodejs/docker-node
#
# The MIT License (MIT)
# Copyright (c) 2015 Joyent, Inc.
# Copyright (c) 2015 Node.js contributors

# Run command with node if the first argument contains a "-" or is not a system command. The last
# part inside the "{}" is a workaround for the following bug in ash/dash:
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=874264
if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ] || { [ -f "${1}" ] && ! [ -x "${1}" ]; }; then
  set -- ringo "$@"
fi

exec "$@"
