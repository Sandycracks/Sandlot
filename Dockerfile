FROM python:3.10-slim

RUN pip install evennia

WORKDIR /app
COPY . /app

RUN evennia migrate
RUN evennia collectstatic --noinput

EXPOSE 4001
CMD ["evennia", "start", "--inplace"]
