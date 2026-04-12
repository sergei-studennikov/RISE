#!/bin/bash
img_name="wa-image"
cont_name="wa-container"
docker stop $cont_name>/dev/null 2>&1
docker remove $cont_name>/dev/null 2>&1
docker run -d \
  -p 6080:3000 \
  --shm-size=2g \
  -e PUID=1000 \
  -e PGID=1000 \
  --name $cont_name \
  $img_name
