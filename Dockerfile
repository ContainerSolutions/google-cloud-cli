FROM alpine:3.5

MAINTAINER Container Solutions <info@container-solutions.com>

RUN apk add -U bash curl python git

RUN mkdir /opt

# Install gcloud
RUN curl -LO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-159.0.0-linux-x86_64.tar.gz && \
    tar xf google-cloud-sdk-159.0.0-linux-x86_64.tar.gz && \
    mv google-cloud-sdk /opt/google-cloud-sdk && \
    ln -s /opt/google-cloud-sdk/bin/gcloud /bin/gcloud && \
    rm google-cloud-sdk-159.0.0-linux-x86_64.tar.gz

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/bin/kubectl

# Aliases
RUN echo 'alias kc=kubectl' >> ~/.bashrc

ENTRYPOINT ["/bin/bash"]
CMD [""]
