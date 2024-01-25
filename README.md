# Flask Hello World on Kubernetes via Helm

## Build

* Set an environment variable with your GCP Project ID:

```
export GOOGLE_CLOUD_PROJECT=<PROJECT_ID>
```

```sh
gcloud builds submit --tag=gcr.io/${GOOGLE_CLOUD_PROJECT}/flask-helloworld src/
```

## Run Locally

```sh
docker run -p 8080:8080 -e PORT=8080 --rm gcr.io/${GOOGLE_CLOUD_PROJECT}/flask-helloworld
```

## Test

```
pytest src/tests/
```

_Note: you may need to install `pytest` using `pip install pytest`._

## Deploy

### Helm
* Complete the [Build](#build) step
* Install/ Upgrade a release
```sh
helm upgrade --install dev ./helm/ --set gcpProjectId="${GOOGLE_CLOUD_PROJECT}" --debug
```

### Cloud Build
```sh
gcloud builds submit --config=cloudbuild.yaml --substitutions=_CLOUDSDK_COMPUTE_ZONE="<CLUSTER-ZONE>",_CLOUDSDK_CONTAINER_CLUSTER="<CLUSTER-NAME>"
```
_Note: Make sure your cloud build service account have all the required permissions._