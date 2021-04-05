FROM archlinux

RUN pacman -Sy squid --noconfirm

COPY ./squid.conf /etc/squid/squid.conf

EXPOSE 3128/tcp
VOLUME /var/cache/squid
VOLUME /var/log/squid

CMD /usr/sbin/squid -z --foreground; /usr/sbin/squid --foreground
