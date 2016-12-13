# OpenVPNAS
Scripts and configurations for my OpenVPNAS installation

#Files
- autoRenewSSLCert.sh: Auto certificate update if using LetsEncrypt. In my setup, I have a ngnix server exposed on the same machine that runs OpenVPNAS. The nginx server is used to verify ownership of my domain with LetsEncrypt and enables me to receive a new TLS certificate automatically before my current certificate expires. This script installs any new certificates into the OpenVPNAS server and outputs information about the running of this script to STDOUT, which is captured by cron and emailed to me.

 - To use this script, create a cron job similar to the following:
    
    ```
    MAILTO="EMAIL ADDRESS"
    0 5 1 * * /home/scripts/autoRenewSSLCert.sh
    ```
    and update the script with your domain/host name.

    You'll also need to set up sSMTP for your server to be able to send the e-mails. The answer on this page provides a good overview of how you can do it: https://askubuntu.com/questions/536766/how-to-make-crontab-email-me-with-output

Also see: https://github.com/kevinfealey/NetworkMonitoring/blob/master/postAuth.py which is a Python script to be executed upon successful login to OpenVPN Access Server.
