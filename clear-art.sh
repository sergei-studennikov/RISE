#!/bin/bash
img_name="wa-image"
cont_name="wa-container"
docker stop $cont_name>/dev/null 2>&1
docker rm $cont_name>/dev/null 2>&1
docker rmi $img_name
