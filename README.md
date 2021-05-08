# Lutra's mergin.client

## Building

```./build.sh```

The Dockerfile contains some tricks to try to reduce the size of the resulting image.

## Example usage:

Getting help:

docker run -ti kartoza/mergin-client

Cloning into a shared volume:

docker run -ti -v ${PWD}/projects:/home/mergin/projects -e MERGIN_AUTH=XXXXX kartoza/mergin-client clone cvaz/teste_cvaz /home/mergin/projects/
