# syntax=docker/dockerfile:1

ARG PYTHON_VERSION=3.11.4
FROM python:${PYTHON_VERSION}-slim AS base

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

WORKDIR /app
RUN apt-get update && \
  apt-get install -y git && \
  rm -rf /var/lib/apt/lists/*

# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

ARG GIT_TAG=TS-24.10-BETA.1
RUN python -m pip install git+https://github.com/truenas/api_client.git@${GIT_TAG}

# Switch to the non-privileged user to run the application.
USER appuser

ENTRYPOINT ["/usr/local/bin/midclt"]
CMD ["-h"]
