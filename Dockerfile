FROM nginx:stable
RUN apt-get update -qq && apt-get install -y geoip-database wget

RUN wget -N https://mirrors-cdn.liferay.com/geolite.maxmind.com/download/geoip/database/GeoIP.dat.gz
RUN gunzip GeoIP.dat.gz
RUN wget -N https://mirrors-cdn.liferay.com/geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.xz
RUN gunzip GeoLiteCity.dat.gz

RUN mkdir /etc/nginx/geoip/
RUN mv GeoIP.dat /etc/nginx/geoip/
RUN mv GeoLiteCity.dat /etc/nginx/geoip/
COPY ./nginx.conf /etc/nginx/
COPY ./static /usr/share/nginx/html
