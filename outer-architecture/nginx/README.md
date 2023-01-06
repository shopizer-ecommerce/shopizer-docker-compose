Docker image for creating a web server that ca serve images using cms 0 httpd ability


docker build -t httpd .
docker run -it --rm -d -p 80:80 -v $PWD/web:/usr/share/nginx/html httpd
