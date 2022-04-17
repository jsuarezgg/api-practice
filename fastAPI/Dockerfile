FROM python:3.9

WORKDIR /app
COPY . /app

RUN pip install poetry
RUN python -m venv /env && . /env/bin/activate && poetry install

CMD ["/env/bin/gunicorn", "asgi:app", "-b", "0.0.0.0:5000", "-k", "uvicorn.workers.UvicornWorker"]