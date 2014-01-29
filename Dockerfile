FROM binaryphile/ruby:2.0.0-p247

RUN apt-get install libsqlite3-dev #dev-time only

RUN mkdir /var/app
ADD . /var/app/bacino
RUN chmod +x /var/app/bacino/bin/start.sh

WORKDIR /var/app/bacino
CMD "/var/app/bacino/bin/start.sh"