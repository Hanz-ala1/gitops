# A simple static site server using Nginx test
FROM alpine:3.22.2
RUN apk upgrade --no-cache expat
COPY site/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
