FROM ubuntu:20.04

RUN apt-get update -qq && \
    apt-get install -y -qq openssh-client mysql-client telnet && \
    rm -rf /var/lib/apt/lists/*

COPY .docker/.ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh/*

COPY tunnel-mysql.sh .
RUN chmod 777 tunnel-mysql.sh

ENTRYPOINT [ "./tunnel-mysql.sh" ]

EXPOSE 13306