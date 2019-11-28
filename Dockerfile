# Base image
FROM alpine:3.5

# Install pip package for alpine Linux distribution
RUN apk add --update py2-pip

# Install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# Specify the port number
EXPOSE 5000

# cmd for running the application
CMD ["python", "/usr/src/app/app.py"]
