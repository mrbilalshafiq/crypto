# Start from the official Python 3.8 Docker image.
FROM python:3.8

# Set the working directory to /app.
WORKDIR /app

# Copy the requirements.txt file to the working directory.
COPY requirements.txt /app/requirements.txt

# Install the required Python packages.
RUN pip install -r requirements.txt
RUN pip install flask -U

# Copy the Flask app code to the working directory.
COPY app.py /app/app.py
COPY templates /app/templates

# Expose port 5000.
EXPOSE 5000

# Run the Flask app when the Docker container is started.
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
