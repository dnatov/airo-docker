# airo-docker
A simple Docker image for a full [airo-mono](https://github.com/airo-ugent/airo-mono) environment.

## Getting started 🚀
Follow the Docker [Installation](https://docs.docker.com/get-started/) applicable to your OS

## Docker Usage
Building:
```
docker build -t airo-docker-image .
```
Running:
```
docker run -it airo-docker-image
```

## Optional Steps

### Create a workspace

Use a [bind mount](https://docs.docker.com/engine/storage/bind-mounts/) to create a workspace. Allowing files to be synced from the container to local OS folders across docker runs.
```
mkdir workspace
docker run -it -v $(pwd)/workspace:/workspace/airo
```

### Combining with the UR Simulator

A [UR-Simulator](https://hub.docker.com/r/universalrobots/ursim_e-series) Container is also available. A [docker compose](https://docs.docker.com/compose/) file can be used to combine both containers and connect to a simulated robot. See `example-docker-compose.yml` for context.

After creating a compose file, run the docker command:
```
docker-compose -f docker-compose.yml --profile ur-simulator up # Specify ur-simulator profile to run ursim as well
```

Connect to the simulated robot in airo:
```
robot_ip_address = "ursim_airo" # Using docker compose image name
robot = URrtde(ip_address=robot_ip_address)
```