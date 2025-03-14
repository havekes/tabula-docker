FROM amazoncorretto:8

ENV TABULA_VERSION=1.2.1

RUN yum install -y unzip
RUN curl -L -f -o tabula.zip https://github.com/tabulapdf/tabula/releases/download/v${TABULA_VERSION}/tabula-jar-${TABULA_VERSION}.zip
RUN unzip tabula.zip 
RUN rm tabula.zip

EXPOSE 8080

CMD ["java", "-Dfile.encoding=utf-8", "-Xms256M", "-Xmx1024M", "-jar", "tabula/tabula.jar"]