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

* Complete the [Build](#build) step
* Replace GOOGLE_CLOUD_PROJECT with your GCP Project ID in [deploy.yaml](deploy.yaml)
```
sed -i 's/GOOGLE_CLOUD_PROJECT/${GOOGLE_CLOUD_PROJECT}/g' deploy.yaml
```
* Apply the manifest file
```
kubectl apply -f deploy.y
````