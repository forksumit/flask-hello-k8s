# Flask Hello World on Kubernetes

## Build

* Set an environment variable with your GCP Project ID:

```
export GOOGLE_CLOUD_PROJECT=<PROJECT_ID>
```

```sh
gcloud builds submit --tag=gcr.io/${GOOGLE_CLOUD_PROJECT}/helloworld
```

## Run Locally

```sh
docker run -p 8080:8080 -e PORT=8080 --rm gcr.io/${GOOGLE_CLOUD_PROJECT}/helloworld
```

## Test

```
pytest
```

_Note: you may need to install `pytest` using `pip install pytest`._

## Deploy

Coming Soon !!
<!-- ```sh
kubectl apply -f deploy.yml
``` -->