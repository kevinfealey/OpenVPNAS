#!/bin/sh
HOSTNAME="my-hostname.com"

if ! /letsencrypt/letsencrypt-auto renew > /var/log/letsencrypt/renew.log 2>&1 ; then
    echo Automated renewal failed:
    cat /var/log/letsencrypt/renew.log
    exit 1
fi
 cat /var/log/letsencrypt/renew.log

cd /usr/local/openvpn_as/scripts

echo "Updating private key"
./confdba -mk cs.priv_key --value_file=/etc/letsencrypt/live/$HOSTNAME/privkey.pem
echo "Updating ca bundle"
./confdba -mk cs.ca_bundle --value_file=/etc/letsencrypt/live/$HOSTNAME/fullchain.pem
echo "Updating certificate"
./confdba -mk cs.cert --value_file=/etc/letsencrypt/live/$HOSTNAME/cert.pem
echo "Restarting openvpnas server"
/etc/init.d/openvpnas restart
