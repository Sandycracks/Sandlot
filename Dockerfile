FROM python:3.11

RUN apt-get update && apt-get install -y libpq-dev gcc

RUN pip install evennia

WORKDIR /app
COPY . .

CMD ["evennia", "start"]
