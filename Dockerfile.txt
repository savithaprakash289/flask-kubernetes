# Use a base image with Python pre-installed
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy your Python script into the container
COPY app.py .

# Install Flask, a lightweight web framework for Python
RUN pip install flask

# Expose port 80 for web traffic
EXPOSE 8002

# Define the command to run when the container starts
CMD ["python", "app.py"]
