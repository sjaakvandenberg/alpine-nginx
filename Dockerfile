FROM alpine:3.4

# ln -sf /dev/stdout /var/log/nginx/access.log \
# ln -sf /dev/stderr /var/log/nginx/error.log \
# rm /etc/nginx/conf.d/default.conf \
# chown -R www-data:www-data /etc/nginx/conf.d/ /etc/nginx/nginx.conf /usr/sbin/nginx

RUN set +x \
apk add --no-cache curl nginx \
&& addgroup -g 82 -S www-data \
&& adduser -u 82 -D -S -G www-data www-data

COPY nginx.conf     /etc/nginx/nginx.conf
COPY conf.d/        /etc/nginx/conf.d

ADD app/ /app

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
