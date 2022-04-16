FROM python:3.8

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && \
    apt-get install -yy libpq-dev build-essential && \
    pip install -r requirements.txt

COPY . /app
EXPOSE 5000
ENTRYPOINT ["uwsgi", "uwsgi.ini"]