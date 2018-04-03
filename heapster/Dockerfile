FROM buildpack-deps:stretch-curl

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends iputils-ping snmp procps && \
    rm -rf /var/lib/apt/lists/*

ENV TELEGRAF_VERSION 1.5.3-azmon

RUN wget --no-verbose https://masdiagstore.blob.core.windows.net/share/telegraf_1.5.3-azmon-l_amd64.tar.gz && \
    tar xvfz telegraf_1.5.3-azmon-l_amd64.tar.gz && \    
    mv ./telegraf /usr/bin/telegraf && \    
    rm -f telegraf_1.5.3-azmon-l_amd64.tar.gz*

EXPOSE 8125/udp 8092/udp 8094 8086

COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]