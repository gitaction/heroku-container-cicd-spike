#!/bin/bash
set -e

echo "> Pushing image to heroku image registry..."

echo "${HEROKU_TOKEN}" | \
docker login --username=_ --password-stdin registry.heroku.com

docker tag heroku-container-cicd-spike:latest registry.heroku.com/heroku-container-cicd-spike/web:latest
docker push registry.heroku.com/heroku-container-cicd-spike/web:latest
