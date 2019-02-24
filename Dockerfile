FROM python:3.6
MAINTAINER "Christopher Hayden Todd <Christopher.Hayden.Todd@gmail.com>"

# Configure Environment
USER root
ENV APP_ROOT=/code/
ENV ENV_TIER="development"
ENV PYTHONUNBUFFERED=1

# Run Installation Commands and Make Directories
WORKDIR ${APP_ROOT}
RUN mkdir -p /code
RUN mkdir -p /data
ADD . ${APP_ROOT}

# Install Linux Dependencies
RUN apt-get update; apt-get install -y $(awk '{print $1'} ./docker_environment/linux_packages.txt)

# Install Python Dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -r docker_environment/python_packages.txt

# Clean Up Installation Files in Image
RUN xargs rm -rf < docker_environment/directory_cleanup.txt

HEALTHCHECK --interval=5s --timeout=3s CMD ["bash", "/code/healthcheck.sh"]
CMD ["bash", "/code/run-command.sh"]
