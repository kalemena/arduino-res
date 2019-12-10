FROM ubuntu:18.04

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION=1.8.10
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Kalemena Arduino Tools" \
      org.label-schema.description="Kalemena Arduino Tools" \
      org.label-schema.url="private" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/kalemena/iot-tools" \
      org.label-schema.vendor="Kalemena" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND=noninteractive

# Pre-requisits
RUN apt-get -y update \
	&& apt-get -y install \
        software-properties-common \
        wget unzip \
        openjdk-8-jre \
        python3 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Arduino IDE
RUN wget -q -O- https://downloads.arduino.cc/arduino-${VERSION}-linux64.tar.xz | tar xJC /usr/local/share \
 	&& ln -s /usr/local/share/arduino-${VERSION} /usr/local/share/arduino \
 	&& ln -s /usr/local/share/arduino-${VERSION}/arduino /usr/local/bin/arduino

# Setup User (http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/)
ENV HOME /home/developer

# Flash Tools
RUN pip3 --no-cache-dir install esptool

# Boards
# ESP8266
RUN mkdir -p /usr/local/share/arduino/hardware/esp8266com \
    && cd /usr/local/share/arduino/hardware/esp8266com \
    && wget -q https://github.com/esp8266/Arduino/archive/master.zip && unzip -q master.zip && rm master.zip \
    && mv Arduino-master esp8266 \
    && cd esp8266/tools \
    && python3 get.py
# ESP32
RUN mkdir -p /usr/local/share/arduino/hardware/esp32com \
    && cd /usr/local/share/arduino/hardware/esp32com \
    && wget -q https://github.com/espressif/arduino-esp32/archive/master.zip && unzip -q master.zip && rm master.zip \
    && mv arduino-esp32-master esp32 \
    && cd esp32/tools \
    && python3 get.py

# Hide Boards
ADD [ "boards/boards-*.txt", "/tmp/" ]
RUN cat /tmp/boards-arduino.txt >> /usr/local/share/arduino/hardware/arduino/avr/boards.txt \
    && cat /tmp/boards-esp8266.txt >> /usr/local/share/arduino/hardware/esp8266com/esp8266/boards.txt \
    && cat /tmp/boards-esp32.txt >> /usr/local/share/arduino/hardware/esp32com/esp32/boards.txt

# ADD Libraries
RUN mkdir -p ${HOME}/Arduino/libraries
WORKDIR ${HOME}/Arduino/libraries
# JeeLib
RUN wget -q https://github.com/jeelabs/jeelib/archive/master.zip && unzip -q master.zip && rm master.zip
# LowPowerLab
RUN wget -q https://github.com/LowPowerLab/RFM69/archive/master.zip && unzip -q master.zip && rm master.zip
RUN wget -q https://github.com/LowPowerLab/SPIFlash/archive/master.zip && unzip -q master.zip && rm master.zip
RUN wget -q https://github.com/LowPowerLab/LowPower/archive/master.zip && unzip -q master.zip && rm master.zip
# Adafruit
RUN wget -q https://github.com/adafruit/Adafruit_Sensor/archive/master.zip && unzip -q master.zip && rm master.zip
# HTU21
RUN wget -q https://github.com/adafruit/Adafruit_HTU21DF_Library/archive/master.zip && unzip -q master.zip && rm master.zip
# DHT22
RUN wget -q https://github.com/adafruit/DHT-sensor-library/archive/master.zip && unzip -q master.zip && rm master.zip
# BME280
RUN wget -q https://github.com/adafruit/Adafruit_BME280_Library/archive/master.zip && unzip -q master.zip && rm master.zip
# OneWire / DS18B20
RUN wget -q https://github.com/PaulStoffregen/OneWire/archive/master.zip && unzip -q master.zip && rm master.zip
RUN wget -q https://github.com/milesburton/Arduino-Temperature-Control-Library/archive/master.zip && unzip -q master.zip && rm master.zip
# TSL2561
RUN wget -q https://github.com/adafruit/TSL2561-Arduino-Library/archive/master.zip && unzip -q master.zip && rm master.zip
# FastLED
#RUN wget -q https://github.com/kalemena/no-hell-lights/raw/master/libraries/FastLED-3.2.0.zip && unzip -q FastLED-3.2.0.zip && rm FastLED-3.2.0.zip
RUN wget -q https://github.com/FastLED/FastLED/archive/3.3.2.zip && unzip -q 3.3.2.zip && rm 3.3.2.zip
# WebSocket
RUN wget -q https://github.com/Links2004/arduinoWebSockets/archive/master.zip && unzip -q master.zip && rm master.zip
# JSON
RUN wget -q https://github.com/bblanchon/ArduinoJson/releases/download/v5.13.5/ArduinoJson-v5.13.5.zip && unzip -q ArduinoJson-v5.13.5.zip && rm ArduinoJson-v5.13.5.zip

WORKDIR ${HOME}

RUN export uid=1000 gid=1000 \
    && mkdir -p /home/developer \
    && mkdir -p /etc/sudoers.d \
    && echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd \
    && echo "developer:x:${uid}:" >> /etc/group \
    && echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer \
    && chmod 0440 /etc/sudoers.d/developer \
    && chown ${uid}:${gid} -R /home/developer \
    && sed "s/^dialout.*/&developer/" /etc/group -i \
    && sed "s/^root.*/&developer/" /etc/group -i
USER developer

ENV DISPLAY :1.0
