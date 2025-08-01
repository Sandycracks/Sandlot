FROM python:3.11

RUN apt-get update && apt-get install -y libpq-dev gcc

RUN pip install evennia

WORKDIR /app
COPY . .

RUN evennia migrate || true
RUN evennia collectstatic --noinput || true

EXPOSE 4001
CMD ["evennia", "start"]
