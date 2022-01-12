#!/bin/bash
set -e

echo "> Deploy web image..."

APP_NAME="heroku-container-cicd-spike"
WEB_DOCKER_IMAGE_REF="$(docker inspect registry.heroku.com/heroku-container-cicd-spike/web:latest --format={{.Id}})"

curl -n -X PATCH https://api.heroku.com/apps/${APP_NAME}/formation \
  -d '{
  "updates": [
    {
      "type": "web",
      "docker_image": "'"${WEB_DOCKER_IMAGE_REF}"'"
    }
  ]
}' \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer "${HEROKU_TOKEN}"" \
  -H "Accept: application/vnd.heroku+json; version=3.docker-releases"
