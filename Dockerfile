FROM quay.io/keycloak/keycloak:latest

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Enable edge mode because we are behind a proxy
ENV KC_PROXY=edge

# Disable HTTPs as Digital Ocean App Platform terminates the SSL
ENV KC_HTTP_ENABLED=true

# Configure a database vendor
ENV KC_DB=postgres

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
CMD [ "start", "--optimized" ]
