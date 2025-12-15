# syntax=docker/dockerfile:1.7-labs

# BUILDER
FROM python:3.12-slim AS builder

WORKDIR /app

# Install Poetry
ENV POETRY_VERSION=2.0.1
ENV POETRY_HOME=/opt/poetry
ENV POETRY_VIRTUALENVS_IN_PROJECT=1
ENV POETRY_VIRTUALENVS_CREATE=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV POETRY_CACHE_DIR=/opt/.cache

RUN pip install "poetry==${POETRY_VERSION}"

# Reproduce the environment
COPY pyproject.toml poetry.lock ./

# Install the dependencies with system packages and clear the cache afterwards
RUN poetry install --no-root && \
    rm -rf "$POETRY_CACHE_DIR"

# RUNTIME
FROM python:3.12-slim AS runtime

RUN groupadd -r defaultuser && useradd -g defaultuser defaultuser
WORKDIR /magic-hiring

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV VIRTUAL_ENV=/app/.venv
ENV PATH="/app/.venv/bin:$PATH"

COPY --from=builder ${VIRTUAL_ENV} ${VIRTUAL_ENV}
COPY --exclude=database . .

RUN chown -R defaultuser:defaultuser /home

USER defaultuser

WORKDIR /magic-hiring/magic_hiring

ENV PYTHONPATH "${PYTHONPATH}:/magic-hiring"

CMD ["streamlit", "run", "--server.address", "0.0.0.0", "app.py"]
