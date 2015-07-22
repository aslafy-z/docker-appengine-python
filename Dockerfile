FROM python:2.7-slim

ENV PATH $PATH:/usr/local/google-cloud-sdk/bin

RUN \
  apt-get update \
  && apt-get autoremove -y \
  && apt-get install -y gcc wget

RUN \
  wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz -P /tmp/ \
  && tar -C /usr/local/ -xf /tmp/google-cloud-sdk.tar.gz \
  && CLOUDSDK_CORE_DISABLE_PROMPTS=1 /usr/local/google-cloud-sdk/install.sh \
       --usage-reporting false \
       --path-update false \
       --command-completion false \
  && rm /tmp/google-cloud-sdk.tar.gz

RUN CLOUDSDK_CORE_DISABLE_PROMPTS=1 gcloud components update \
    app \
    preview \
    app-engine-python
