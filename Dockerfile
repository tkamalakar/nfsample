# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.6

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# ARG APP_ARG
# ENV APP_ENV $APP_ARG

# RUN echo "The ENV variable value is $APP_ENV"

# create root directory for our project in the container
RUN mkdir /mysample

# Set the working directory to /mysample
WORKDIR /mysample

# Copy the current directory contents into the container at /mysample
ADD . /mysample/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
RUN pip install gunicorn

# ENTRYPOINT python manage.py runserver 0.0.0.0:8000
# ENTRYPOINT python manage.py runserver_plus --cert-file 54.162.36.204.pem --key-file 35.171.9.166.key 0.0.0.0:8000
ENTRYPOINT gunicorn -b 0.0.0.0:8000 mysample.wsgi
