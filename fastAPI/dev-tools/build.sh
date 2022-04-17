#!/bin/bash -e

IMAGE_NAME="api-test-fastapi"
IMAGE_TAG=${DOCKER_IMAGE_TAG:-'latest'}

REPO_ROOT_DIR="$(git rev-parse --show-toplevel)/fastAPI"
REPO_DEV_TOOLS_DIR="${REPO_ROOT_DIR}/dev-tools"

docker build -t ${IMAGE_NAME}:"${IMAGE_TAG}" -f "${REPO_DEV_TOOLS_DIR}"/Dockerfile.test "${REPO_ROOT_DIR}"