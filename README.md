`docker-compose` is attaching volume for tsdb to `prometheus` container. For this work correctly `data` folder should exist locally and be owned by `65534:65534` (the user that is used in prometheus container)

Note that prometheus is polling API which is not part of this repository.