FROM jakexks/tiny-nginx
MAINTAINER Jake Sanders <jake@livewyer.com>

ADD consul-template /bin/consul-template

RUN mkdir -p /etc/service/nginx && mkdir -p /etc/service/consul-template && rm /etc/nginx/nginx.conf
ADD consul-template.service /etc/service/consul-template/run
ADD nginx.conf /etc/consul-templates/nginx.conf
ADD nginx.service /etc/service/nginx/run

CMD ["/usr/bin/runsvdir", "/etc/service"]
