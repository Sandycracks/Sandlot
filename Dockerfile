FROM python:3.11

# Install system packages needed for Evennia
RUN apt-get update && apt-get install -y libpq-dev gcc

# Install Evennia
RUN pip install evennia

# Set working directory inside the container
WORKDIR /app

# Copy your game files into the container
COPY . .

# Start Evennia server
CMD ["evennia", "start"]
