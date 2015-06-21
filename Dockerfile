FROM java:7u79-jdk

ENV LANG c.UTF-8

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN curl http://eclipse.mirror.garr.it/mirrors/eclipse//technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz | tar -xz

RUN mkdir -p ./workspace

RUN useradd padow -u 1000 -s /bin/bash --no-create-home
RUN chown -R padow ./
USER padow

ENV HOME ./workspace

VOLUME /usr/src/app/workspace

CMD ./eclipse/eclipse
