FROM python:2.7-slim

ENV PATH $PATH:/usr/local/google_appengine

RUN \
  apt-get update \
  && apt-get autoremove -y \
  && apt-get install -y gcc wget unzip

ENV GAE_SDK_VERSION 1.9.22

RUN \
  wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_${GAE_SDK_VERSION}.zip -P /tmp/ \
  && unzip /tmp/google_appengine_${GAE_SDK_VERSION}.zip -d /usr/local/ \
  && rm /tmp/google_appengine_${GAE_SDK_VERSION}.zip
