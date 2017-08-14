# Google Cloud CLI
This Docker image features the tools required to interact with the Google Cloud API
(via the `gcloud` CLI tool and with any Kubernetes cluster, both hosted (via the GKE)
or running on prem

# Usage
Pull the latest image with

```
$ docker pull containersol/google-cloud-cli
```

You most likely will want to keep a local copy of the cache directories of `gcloud` and `kubectl`, so
this is the most effective way to run and use this image:

```
$ docker run --rm -v $(PWD)/config:/root/.config -v $(PWD)/kube:/root/.kube -it containersol/google-cloud-cli
```
