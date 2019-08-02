FROM nginx:stable-alpine

RUN mkdir pacman-cache
ADD ./pacman-cache/ /pacman-cache
VOLUME /pacman-cache

COPY ./mirrors.conf /etc/nginx/
COPY ./proxy.conf /etc/nginx/nginx.conf

EXPOSE 80/tcp

CMD chown -R nginx:nginx /pacman-cache/; nginx -g 'daemon off;'
