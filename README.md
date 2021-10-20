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


# Security #

You can edit `application.conf` to add security tokens, but it may be better to put this behind a proxy and let the proxy handle authentication. Be careful not to expose this to the internet.

# Additional information #

Openscoring-Docker is developed and maintained by Openscoring Ltd, Estonia.
