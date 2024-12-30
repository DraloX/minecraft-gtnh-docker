FROM eclipse-temurin:17-jre-alpine
# file name and url for the server
ARG url=https://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.7.1_Server_Java_17-21.zip
ARG filename=GT_New_Horizons_2.7.1_Server_Java_17-21.zip
# get server files
RUN mkdir /opt/server
RUN mkdir /opt/server/_data
RUN wget $url
RUN mv $filename /opt/server
WORKDIR /opt/server
RUN unzip $filename
# copy files in the container
COPY src/eula.txt /opt/server
COPY src/copydata.sh /opt/server
COPY src/savedata.sh /opt/server
COPY src/start.sh /opt/server
COPY src/server.properties /opt/server
RUN chmod +x startserver-java9.sh
RUN chmod +x start.sh
RUN chmod +x copydata.sh
RUN chmod +x savedata.sh
# add volumes for worlds, logs and configs to persist on host
VOLUME /opt/server/worlds
VOLUME /opt/server/logs
VOLUME /opt/server/backups
VOLUME /opt/server/serverutilities
VOLUME /opt/server/_data
CMD ["/opt/server/start.sh"]