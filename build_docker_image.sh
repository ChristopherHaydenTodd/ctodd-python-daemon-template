#!/usr/bin/env bash
#
# Build and Tag .avro Cleaner Docker Image (Locally)
#

DOCKERFILE="./"
IMAGE_NAME="ctodd-python-daemon-template"
IMAGE_VERSION=""

# Parse CLI Arguments
while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -V|-v|--version)
        IMAGE_VERSION="$2"
        shift
        shift
        ;;
        --version=*)
        IMAGE_VERSION="${1#*=}"
        shift
        ;;
        *)
        shift
        ;;
    esac
done

if [ -z "${IMAGE_VERSION}" ]
then
  IMAGE_VERSION="$(cat ./VERSION)"
  echo "$(date +%c): Got Version from File: ${IMAGE_VERSION}"
else
  echo "$(date +%c): Got Version from CLI: ${IMAGE_VERSION}"
fi

IMAGE="${IMAGE_NAME}:${IMAGE_VERSION}"

echo "$(date +%c): Building and Tagging ${IMAGE} from Dockerfile ${DOCKERFILE}"
docker build --tag=${IMAGE} ${DOCKERFILE}
