FROM quay.io/keycloak/keycloak:23.0.4

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
CMD [ "start-dev" ]
