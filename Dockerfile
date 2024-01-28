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

# Set max queued requests, to ensure we can service the requests in progress
ENV KC_HTTP_MAX_QUEUED_REQUESTS=100

# Whilst we are only running a single instance of Keycloak, we do not need
# to bother with a distributed cache, so here just force local caching only.
#ENV KC_CACHE=local
# Test out using a distributed cache with 3 instances of Keycloak
ENV KC_CACHE=ispn

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
CMD [ "start" ]
