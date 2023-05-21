### General info
`docker-compose` is attaching volume for tsdb to `prometheus` container. For this work correctly `data` folder should exist locally and be owned by `65534:65534` (the user that is used in prometheus container)

Note that prometheus is polling API which is not part of this repository.

### Verifing setup works with Prometheus graph explorer
1. Run `api` and `website`
2. Run this setup with `docker-compose up -d`
3. Navigate to `http://localhost:19090/` (prometheus graph explorer) and lookup for `http_request_total` metric count
4. Perform some actions on the website
5. Check the `http_request_total` metric again and verify the count goes up.

### Grafana
In Grafana a test dashboard for the same `http_request_total` metric is added and saved into a file. Explore `Test dashboard`

### Node exporter
Node exporter allows collecting Linux metrics. For the purpose of this demo we run node exporter right on the host machine. Make sure the node exporter executable is placed under the `bin/` directory.
