#!/bin/bash

set -e

export MAAS_PROFILE=${MAAS_PROFILE:-api}

maas_login() {
    if [ -z "$MAAS_URL" ]; then
        echo "MAAS_URL is not set"
        echo "e.g. http://<maas_ip>:5240/MAAS"
        exit 1
    fi

    if [ -z "$MAAS_API_KEY" ]; then
        echo "MAAS_API_KEY is not set"
        exit 1
    fi

    maas login $MAAS_PROFILE $MAAS_URL $MAAS_API_KEY > /dev/null
}

if [ "$1" != "bash" -a ! -f /root/.maascli.db ]; then
    maas_login
fi

exec "$@"
