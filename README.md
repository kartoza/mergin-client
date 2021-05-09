# Lutra's mergin.client

## Building

```./build.sh```

The Dockerfile contains some tricks to try to reduce the size of the resulting image.

## Example usage:

Getting help:

docker run -ti kartoza/mergin-client

Cloning into a shared volume:

docker run -ti -v ${PWD}/projects:/home/mergin/projects -e MERGIN_USER=XXXXX -e MERGIN_PASSWORD=XXXXX kartoza/mergin-client clone tim1/GloriusProjectOfMagnificence /home/mergin/projects/

Using docker compose:

There is a small example docker-compose provided in this repo. To use, first
copy .env.example to .env and update the .env file with your credentials.

# Initial download of a project (edit docker compose to specify which)
docker-compose run download-project

# Pull changes to project
docker-compose run pull-projects

# List all projects shared with you
docker-compose run list-shared-projects

# Download all projects shared with you
download-shared-projects



