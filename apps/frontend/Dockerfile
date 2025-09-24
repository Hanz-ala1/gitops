# A simple static site server using Nginx test
FROM alpine:edge
RUN apk add --no-cache nginx expat
COPY site/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
