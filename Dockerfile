# start from an official image
FROM python:2.7

# arbitrary location choice: you can change the directory
RUN mkdir -p /app
WORKDIR /app

# install our dependencies
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# copy our project code
COPY ./notejam /app

# expose the port 8000
EXPOSE 8000

# define the default command to run when starting the container
CMD ["gunicorn", "--chdir", "notejam", "--bind", ":80", "notejam.wsgi:application"]