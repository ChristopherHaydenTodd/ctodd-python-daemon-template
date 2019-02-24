#!/usr/bin/env bash
#
# Push Docker Image To Repository
#

REPOSITORY="dr3x3ldr4g0n"
IMAGE_NAME="ctodd-python-daemon-template"
IMAGE_VERSION=""

# Parse CLI Arguments
while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -R|-r|--repo)
        REPOSITORY="$2"
        shift
        shift
        ;;
        --repo=*)
        REPOSITORY="${1#*=}"
        shift
        ;;
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

if [ -z "${REPOSITORY}" ]
then
  echo "$(date +%c): No Repository Specified, Exiting"
  exit 1
fi

if [ -z "${IMAGE_VERSION}" ]
then
  IMAGE_VERSION="$(cat ./VERSION)"
  echo "$(date +%c): Got Version from File: ${IMAGE_VERSION}"
else
  echo "$(date +%c): Got Version from CLI: ${IMAGE_VERSION}"
fi

IMAGE="${IMAGE_NAME}:${IMAGE_VERSION}"

echo "$(date +%c): Pushing ${IMAGE} to ${REPOSITORY}"
docker tag ${IMAGE} ${REPOSITORY}/${IMAGE}
docker push ${REPOSITORY}/${IMAGE}
