#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-492}
GROUP_ID=${GROUP_USER_ID:-491}
USER_NAME="tomcat"

echo "Changing to UID: $USER_ID GID: $GROUP_ID for $USER_NAME"
usermod -u $USER_ID $USER_NAME
groupmod -g $GROUP_ID $USER_NAME

exec /usr/local/bin/gosu tomcat "$@"

