FROM python:3.11-slim

RUN apt-get update && apt-get install -y gcc libpq-dev

RUN pip install evennia

WORKDIR /app
COPY . .

RUN evennia migrate || true
RUN evennia collectstatic --noinput || true

EXPOSE 4001
CMD ["evennia", "start"]
