FROM jakexks/tiny-nginx
MAINTAINER Jake Sanders <jake@livewyer.com>

ADD consul-template /bin/consul-template

RUN mkdir -p /etc/service/nginx && mkdir -p /etc/service/consul-template && rm /etc/nginx/nginx.conf
ADD consul-template.service /etc/service/consul-template/run
ADD nginx.conf /etc/consul-templates/nginx.conf
ADD nginx.service /etc/service/nginx/run

WORKDIR /srv
RUN rm -rf website && wget http://ftp.drupal.org/files/projects/drupal-7.34.tar.gz && tar -xvf drupal* && rm *.gz && mv drupal* website
WORKDIR /srv/website/sites/default
RUN cp default.settings.php settings.php


CMD ["/usr/bin/runsvdir", "/etc/service"]
