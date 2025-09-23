# A simple static site server using Nginx test
FROM alpine:3.22.1
RUN apk add --no-cache expat --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main
COPY site/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
