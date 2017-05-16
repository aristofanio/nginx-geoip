FROM nginx:stable
RUN apt-get update -qq && apt-get install -y geoip-database wget

RUN wget -N http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
RUN gunzip GeoLiteCity.dat.gz

RUN mv GeoLiteCity.dat /usr/share/GeoIP/
COPY ./nginx.conf /etc/nginx/
COPY ./static /usr/share/nginx/html
