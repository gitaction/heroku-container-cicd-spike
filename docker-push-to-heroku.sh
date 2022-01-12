#!/bin/bash
set -e

echo "> Pushing image to heroku image registry..."

docker login --username=_ --password="${HEROKU_TOKEN}" registry.heroku.com
docker tag heroku-container-cicd-spike:latest registry.heroku.com/heroku-container-cicd-spike/web:latest
docker push registry.heroku.com/heroku-container-cicd-spike/web:latest
