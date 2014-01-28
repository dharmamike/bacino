## Bacino
---
Bacino is a Docker image containing a Sinatra app that manages Docker containers via the remote API running on its own host.

In order for the container to make use of the remote API, when launching the container, you must bind-mount the Docker socket at unix///var/run/docker.sock.

    docker run -d -p 8888:4567 -v /var/run/docker.sock:/var/host_run/docker.sock dharmamike/bacino

