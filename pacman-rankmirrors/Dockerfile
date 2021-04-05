FROM archlinux

RUN pacman -Sy pacman-contrib grep --noconfirm
COPY rankmirrors.sh /

ENTRYPOINT ["/rankmirrors.sh"]
