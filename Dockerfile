FROM alpine
LABEL maintainer="HugeSully@gmail.com"

RUN apk add --no-cache iptables ppp pptpd

COPY ./etc/pptpd.conf    /etc/
COPY ./etc/pptpd-options /etc/ppp/
COPY ./etc/chap-secrets  /etc/ppp/

COPY start.sh /start.sh
RUN chmod 0700 /start.sh

ENTRYPOINT ["/start.sh"]
