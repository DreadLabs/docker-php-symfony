#!/bin/sh

if [ -z "$SUEXEC_USER" ]; then
    echo "[!!!] Please set the SUEXEC_USER environment variable."
    exit 0
fi

mkdir -p -m 0770 /var/app && chown "$SUEXEC_USER":"$SUEXEC_USER" /var/app


# Create a named pipe and redirect anything that comes to it
# to stderr connected to Docker.
#
# @see https://github.com/moby/moby/issues/6880#issuecomment-220637337
# @see https://redmine.lighttpd.net/issues/2731#note-15
#
mkfifo --mode 600 /var/log/app.log
chown "$SUEXEC_USER" /var/log/app.log
cat <> /var/log/app.log 1>&2 &
