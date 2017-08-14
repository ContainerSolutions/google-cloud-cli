# Google Cloud CLI
This Docker image features the tools required to interact with the Google Cloud API
(via the `gcloud` CLI tool and with any Kubernetes cluster, both hosted (via the GKE)
or running on prem

# Usage

## Getting the image
Pull the latest image with

```
$ docker pull containersol/google-cloud-cli
```

## Running the image
You most likely will want to keep a local copy of the cache directories of `gcloud` and `kubectl`, so
this is the most effective way to run and use this image:


## Running the kubectl proxy
At some point you will want to get access to the Kubernetes dashboard that's running remotely. For this you'll
have to run the `kubectl proxy` command, together with some extra options for the Docker daemon so that you can
expose the right ports:

```
$ docker run \ --rm \ -v ${PWD}/config:/root/.config \ -v ${PWD}/kube:/root/.kube \ -p 8001:8001 \ --entrypoint /usr/bin/kubectl \ -it ${NAME} proxy --accept-hosts '^.+$$' --address 0.0.0.0
```

# Development
## Requirements
| What? | Version |
|-------o---------|
| make  | `> 4.1` |

## Building the image
```
$ make build
```

## Running the image
```
$ make run
```

## Running the kubectl proxy
```
$ make proxy
```

## Making a new release
```
$ make release
```
