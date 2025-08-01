FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y gcc libpq-dev

# Install Evennia
RUN pip install evennia

# Set working directory
WORKDIR /app

# Copy app files into the container
COPY . .

# Run initial migrations and collect static files
RUN evennia migrate || true
RUN evennia collectstatic --noinput || true

# Expose Evennia's webclient port
EXPOSE 4001

# Start Evennia
CMD ["evennia", "start"]
