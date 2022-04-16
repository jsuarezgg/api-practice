#!/bin/bash -e
REPO_ROOT_DIR="$(git rev-parse --show-toplevel)/flask"
export DOCS_PATH=docs
export FILE_NAME_N_EXT=api-practice-flask-openapi
OPENAPI_JSON="${REPO_ROOT_DIR}/${DOCS_PATH}/${FILE_NAME_N_EXT}.json"

docker compose down --remove-orphans

docker compose -f docker-compose-docs.yml up --build --force-recreate --abort-on-container-exit

docker compose -f docker-compose-docs.yml down --remove-orphans

if [ -f "$OPENAPI_JSON" ]; then
  if grep -q {} $OPENAPI_JSON; then
    echo "WARNING. DOCS WERE CLEANED!"
    exit 1
  fi

  echo "SUCCESS GENERATING OPEN API DOCS. CIAO!"
  exit 0
else
  echo "ERROR! ${OPENAPI_JSON} DOES NOT EXIST."
  exit 1
fi
