FROM nginx

RUN touch /var/run/nginx.pid && \
  chown -R nginx:nginx /var/run/nginx.pid && \
  chown -R nginx:nginx /var/cache/nginx && \
  apt-get update && \
  apt-get install -y procps

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./site.conf /etc/nginx/conf.d/default.conf
COPY ./index.html /var/www/index.html

USER nginx

VOLUME /var/www