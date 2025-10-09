FROM python:3.10-slim

# Install Poetry
RUN pip install --no-cache-dir poetry

# Set work directory
WORKDIR /app

# Copy pyproject.toml and poetry.lock (if exists)
COPY pyproject.toml .
COPY poetry.lock .

# Install dependencies
RUN poetry install --no-interaction --no-ansi --no-root

# Copy project files
COPY simple_back_python ./simple_back_python

# Expose port
EXPOSE 8000

# Run FastAPI app
CMD ["poetry", "run", "uvicorn", "simple_back_python.app:app", "--host", "0.0.0.0", "--port", "8000"]
