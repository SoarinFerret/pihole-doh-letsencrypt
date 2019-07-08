#!/bin/bash
for domain in ${RENEWED_DOMAINS}; do
	echo "Coping certs for $domain"
	cat "${RENEWED_LINEAGE}/privkey.pem" "${RENEWED_LINEAGE}/cert.pem" > /pihole_certs/combined.pem
	cp "${RENEWED_LINEAGE}/chain.pem" /pihole_certs/chain.pem
	echo "Setting Permissions"
	chown $CERTS_USER_OWNER:$CERTS_GROUP_OWNER /pihole_certs/*
	chmod $CERTS_FILES_MODE /pihole_certs/*
done

