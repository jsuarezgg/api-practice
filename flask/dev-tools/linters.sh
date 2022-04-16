#!/bin/bash -e

IMAGE_NAME="api-test-flask"
IMAGE_TAG=${DOCKER_IMAGE_TAG:-'latest'}

echo "Running linters on the image ${IMAGE_NAME}:${IMAGE_TAG}"

echo "Checking Flake8..."
docker run --rm "${IMAGE_NAME}":"${IMAGE_TAG}" flake8 /app/personalization_api

echo "Checking Black..."
docker run --rm "${IMAGE_NAME}":"${IMAGE_TAG}" black --check --diff --color /app/app

echo "Checking PyDocStyle..."
docker run --rm "${IMAGE_NAME}":"${IMAGE_TAG}" pydocstyle /app/app

echo "Checking MyPY..."
docker run --rm "${IMAGE_NAME}":"${IMAGE_TAG}" mypy --ignore-missing-imports /app/app