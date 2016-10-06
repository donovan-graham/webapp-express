# Webapp
A simple [Express](https://expressjs.com/) web app, including a ci build pipeline using [Concourse CI] (https://concourse.ci/), which publishes a [Docker](https://www.docker.com/) image to [DockerHub](https://hub.docker.com/r/dongraham/webapp-express/).


## Pre-requisites
* Docker (>=1.12.1) and docker-compose (>=1.8.0)
* Concourse CI (>=2.2.1)

## Running the Concourse CI pipeline
```console
$ fly -t ci set-pipeline -p webapp -c .ci/pipeline.yml -l .ci/credentials.yml
$ fly -t ci unpause-pipeline -p webapp
$ fly -t ci trigger-job -j webapp/build -w
```
