#!/bin/bash
# // A part of content of crontab
# m h  dom mon dow   command
# 0 1 * * * /path/to/run.sh
echo $(date "+%Y-%m-%d %H:%M:%S") "starting.." >> /root/cronlog-certbot.txt
docker run --rm --name certbot -v '/etc/letsencrypt:/etc/letsencrypt' -v '/var/lib/letsencrypt:/var/lib/letsencrypt' -v '/home/opc/cloudflare.ini:/root/cloudflare.ini' certbot/dns-cloudflare certonly -d *.trigger.kr -d trigger.kr --dns-cloudflare --dns-cloudflare-credentials /root/cloudflare.ini --email ryan-dev@kakao.com --agree-tos --no-eff-email --force-renewal --dns-cloudflare-propagation-seconds 15
docker run --rm --name certbot -v '/etc/letsencrypt:/etc/letsencrypt' -v '/var/lib/letsencrypt:/var/lib/letsencrypt' -v '/home/opc/cloudflare.ini:/root/cloudflare.ini' certbot/dns-cloudflare certonly -d *.saja-boys.com -d saja-boys.com --dns-cloudflare --dns-cloudflare-credentials /root/cloudflare.ini --email ryan-dev@kakao.com --agree-tos --no-eff-email --force-renewal --dns-cloudflare-propagation-seconds 15
# docker run --rm --name certbot -v '/etc/letsencrypt:/etc/letsencrypt' -v '/var/lib/letsencrypt:/var/lib/letsencrypt' certbot/dns-cloudflare certonly -d *.DOMAIN2.COM --dns-cloudflare --dns-cloudflare-credentials ./cloudflare_cred.ini
# docker run --rm --name certbot -v '/etc/letsencrypt:/etc/letsencrypt' -v '/var/lib/letsencrypt:/var/lib/letsencrypt' certbot/dns-cloudflare certonly -d *.DOMAIN3.COM --dns-cloudflare --dns-cloudflare-credentials ./cloudflare_cred.ini
echo $(date "+%Y-%m-%d %H:%M:%S") "finish" >> /root/cronlog-certbot.txt
