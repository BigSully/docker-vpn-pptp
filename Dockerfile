FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache iptables ppp pptpd

COPY ./etc/pptpd.conf    /etc/
COPY ./etc/pptpd-options /etc/ppp/
COPY ./etc/chap-secrets  /etc/ppp/

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
