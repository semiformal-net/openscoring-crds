Openscoring-Docker
==================

Openscoring application for the Docker distributed applications platform.

This version will set up the REST API server and will deploy all models in /models directory

# Prerequisites #

* Docker 1.5 or newer

# Installation #

Clone the repository:

```
git clone https://github.com/...
```

Enter the project root directory and edit the Openscoring application configuration file `application.conf` as necessary.

Build the image:

```
docker build -t openscoring/openscoring:latest .
```

# Usage #

Run the image in "host" mode:

```
docker run --net="host" openscoring/openscoring:latest
```

There should be a Model REST API endpoint ready at [http://localhost:8080/model](http://localhost:8080/model) now.

# Additional information #

Openscoring-Docker is developed and maintained by Openscoring Ltd, Estonia.
