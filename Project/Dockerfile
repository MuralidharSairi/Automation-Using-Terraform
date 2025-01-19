# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Expose the port the app runs on
EXPOSE 8080

# Install any necessary dependencies (if you need any)
# RUN pip install -r requirements.txt

# Run app.py when the container launches
CMD ["python", "app.py"]
