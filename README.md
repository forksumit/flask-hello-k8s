# Flask Hello World on Kubernetes

## Build

* Set an environment variable with your GCP Project ID:

```
export GOOGLE_CLOUD_PROJECT=<PROJECT_ID>
```

```sh
gcloud builds submit --tag=gcr.io/${GOOGLE_CLOUD_PROJECT}/helloworld src/
```

## Run Locally

```sh
docker run -p 8080:8080 -e PORT=8080 --rm gcr.io/${GOOGLE_CLOUD_PROJECT}/helloworld
```

## Test

```
pytest src/tests/
```

_Note: you may need to install `pytest` using `pip install pytest`._

## Deploy

### Manual
* Complete the [Build](#build) step
* Replace GOOGLE_CLOUD_PROJECT with your GCP Project ID in [manifest/deploy.yaml](manifest/deploy.yaml)
```sh
sed -i 's/GOOGLE_CLOUD_PROJECT/'${GOOGLE_CLOUD_PROJECT}'/g' deploy.yaml
```
* Apply the manifest file
```sh
kubectl apply -f manifest/deploy.yaml
```

### Cloud Build
```sh
gcloud builds submit --config=cloudbuild.yaml --substitutions=_CLOUDSDK_COMPUTE_ZONE="<CLUSTER-ZONE>",_CLOUDSDK_CONTAINER_CLUSTER="<CLUSTER-NAME>"
```
_Note: Make sure your cloud build service account have all the required permissions._