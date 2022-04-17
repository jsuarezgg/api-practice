#!/bin/bash -e

IMAGE_NAME="api-test-fastapi"
IMAGE_TAG=${DOCKER_IMAGE_TAG:-'latest'}

echo "Running linters on the image ${IMAGE_NAME}:${IMAGE_TAG}"

echo "Checking Flake8..."
docker run --rm "${IMAGE_NAME}":"${IMAGE_TAG}" poetry run flake8 /app/app

echo "Checking Black..."
docker run --rm "${IMAGE_NAME}":"${IMAGE_TAG}" poetry run black --check --diff --color /app/app

echo "Checking PyDocStyle..."
docker run --rm "${IMAGE_NAME}":"${IMAGE_TAG}" poetry run pydocstyle /app/app

echo "Checking MyPY..."
docker run --rm "${IMAGE_NAME}":"${IMAGE_TAG}" poetry run mypy --ignore-missing-imports /app/app