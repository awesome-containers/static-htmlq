# Statically linked htmlq

Statically linked [htmlq] container image with [Bash] and [Curl]

> 8.1M (1,1M bash, 4,4M curl)

```bash
ghcr.io/awesome-containers/static-htmlq:latest
ghcr.io/awesome-containers/static-htmlq:0.4.0

docker.io/awesomecontainers/static-htmlq:latest
docker.io/awesomecontainers/static-htmlq:0.4.0
```

Slim statically linked [htmlq] container image with [Bash] and [Curl]
packaged with [UPX]

> 3,5M (578K bash, 2,1M curl)

```bash
ghcr.io/awesome-containers/static-htmlq:latest-slim
ghcr.io/awesome-containers/static-htmlq:0.4.0-slim

docker.io/awesomecontainers/static-htmlq:latest-slim
docker.io/awesomecontainers/static-htmlq:0.4.0-slim
```

[htmlq]: https://github.com/mgdm/htmlq
[Bash]: https://github.com/awesome-containers/static-bash
[Curl]: https://github.com/awesome-containers/static-curl
[UPX]: https://upx.github.io/

<!--
```bash
image="localhost/${PWD##*/}"

podman build -t "$image:latest" .
podman build -t "$image:latest-slim" -f Containerfile-slim \
  --build-arg STATIC_HTMLQ_IMAGE="$image" \
  --build-arg STATIC_HTMLQ_VERSION=latest --no-cache .

echo "$image:latest"
podman inspect "$image:latest" | jq '.[].Size' | numfmt --to=iec
echo "$image:latest-slim"
podman inspect "$image:latest-slim" | jq '.[].Size' | numfmt --to=iec

```
-->
