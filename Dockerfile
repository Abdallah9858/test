# Use an official Python image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Python script into the container
COPY code.py .

# Run the script when the container starts
CMD ["python", "code.py"]

