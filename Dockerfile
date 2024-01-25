FROM quay.io/keycloak/keycloak:latest

ARG db.HOSTNAME
ARG db.PORT
ARG db.USERNAME
ARG db.PASSWORD

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Enable edge mode because we are behind a proxy
ENV KC_PROXY=edge

# Disable HTTPs as Digital Ocean App Platform terminates the SSL
ENV KC_HTTP_ENABLED=true

# Configure a database vendor
ENV KC_DB=postgres

# change these values to point to a running postgres instance
ENV KC_DB_URL_HOST=${db.HOSTNAME}
ENV KC_DB_URL_PORT=${db.PORT}
ENV KC_DB_USERNAME=${db.USERNAME}
ENV KC_DB_PASSWORD=${db.PASSWORD}

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
CMD [ "start-dev" ]
