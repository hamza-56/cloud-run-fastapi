# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.10-slim

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Set the working directory to /app.
ENV APP_HOME /app
WORKDIR $APP_HOME

# Copy production dependencies.
COPY requirements.txt requirements.txt

# Install production dependencies.
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy local code to the container image.
COPY . ./

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec uvicorn main:app --host 0.0.0.0 --port ${PORT} --workers 1
