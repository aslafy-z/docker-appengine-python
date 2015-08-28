FROM alpine:3.2

ENV PATH $PATH:/usr/local/google-cloud-sdk/bin

RUN \
  apk add -U \
    ca-certificates \
    bash \
    gcc \
    wget \
    python \
    python-dev \
    py-pip \
    build-base

RUN \
  wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz -P /tmp/ \
  && tar -C /usr/local/ -xzf /tmp/google-cloud-sdk.tar.gz \
  && CLOUDSDK_CORE_DISABLE_PROMPTS=1 /usr/local/google-cloud-sdk/install.sh \
       --usage-reporting false \
       --path-update false \
       --command-completion false \
  && rm /tmp/google-cloud-sdk.tar.gz

RUN CLOUDSDK_CORE_DISABLE_PROMPTS=1 gcloud components update \
    app \
    preview \
    app-engine-python
