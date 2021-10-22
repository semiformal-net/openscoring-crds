Openscoring-Docker
==================

Openscoring application for the Docker distributed applications platform.

This version will set up the REST API server and will deploy all models in /models directory

# Prerequisites #

* Docker 1.5 or newer

# Installation #

Clone the repository:

```
git clone https://github.com/semiformal-net/openscoring-crds.git
```

Enter the project root directory and edit the Openscoring application configuration file `application.conf` as necessary.

Build the image:

```
docker build -t openscoring/openscoring:latest .
```

# Models #

Any PMML models in the `models` directory will be deployed. I don't think the filename or extension are important, but maybe avoid funky characters in the filenames.

# Usage #

Run the image, exposing port 8080:

```
docker run -p 8080:8080 openscoring/openscoring:latest
```

There should be a Model REST API endpoint ready at [http://localhost:8080/openscoring/model](http://localhost:8080/openscoring/model) now.

Each model in the `models` directory should be deployed.

# GCP #

## App engine

I had some issues deploying this with cloud run. I believe it is cheaper to deploy with run, but I found it more reliable with app engine (even with min-instances=1?!). The instructions below for cloud run will work, but I suggest app engine instead.

```
gcloud app deploy
```

## Cloud run

This will run in GCP and deploy the openscoring API in cloud run. You may need to grant some permissions so cloud run and cloud build play nice:

```
PROJECT_ID=credit-risk-data-science
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
# open https://console.cloud.google.com/cloud-build/settings and click "enable API"
# grant cloud run admin to cloud build service account
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member=serviceAccount:$PROJECT_NUMBER@cloudbuild.gserviceaccount.com \
    --role=roles/run.admin
gcloud iam service-accounts add-iam-policy-binding \
    $PROJECT_NUMBER-compute@developer.gserviceaccount.com \
    --member=serviceAccount:$PROJECT_NUMBER@cloudbuild.gserviceaccount.com \
    --role=roles/iam.serviceAccountUser
```

Once that works you can the build submit command to build the image and deploy the image to cloud run. It is deployed without authentication so please configure authentication before using this for production.

```
gcloud builds submit
```

Cloud run will scale to accommodate the load to your APIs. Once that is working you can connect the build job so that it triggers on [changes to the repository](https://cloud.google.com/build/docs/automating-builds/create-manage-triggers). Now any models you add will be autodeployed!

# Security #

You can edit `application.conf` to add security tokens, but it may be better to put this behind a proxy and let the proxy handle authentication. Be careful not to expose this to the internet.

# Additional information #

Openscoring-Docker is developed and maintained by Openscoring Ltd, Estonia.
