FROM debian:sid

RUN apt-get update && \
    apt-get install -y \
    openvpn \
    net-tools \
    dante-server \
    procps \
    sudo 
	
RUN apt-get install dnsutils -y
RUN apt-get install inetutils-ping -y
RUN apt-get install iputils-ping -y
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#COPY ./theme /root/.bash_theme

COPY ./danted.conf /etc/danted.conf
COPY ./commands/start_server.sh /start_server.sh
COPY ./commands/stop_server.sh /stop_server.sh

ENTRYPOINT [ "sh", "/start_server.sh" ]
