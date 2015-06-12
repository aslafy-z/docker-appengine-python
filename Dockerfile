FROM python:2.7

ENV GAE_SDK_VERSION 1.9.22
ENV PATH $PATH:/usr/local/google_appengine

RUN \
  apt-get update \
  && apt-get autoremove -y \
  && apt-get install unzip

RUN \
  wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_${GAE_SDK_VERSION}.zip -P /tmp/ \
  && unzip /tmp/google_appengine_${GAE_SDK_VERSION}.zip -d /usr/local/ \
  && rm /tmp/google_appengine_${GAE_SDK_VERSION}.zip
