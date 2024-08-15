# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Install required system packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Docker CLI
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

# Install Cog
RUN curl -o /usr/local/bin/cog -L https://github.com/replicate/cog/releases/latest/download/cog_$(uname -s)_$(uname -m) \
    && chmod +x /usr/local/bin/cog

# Set the working directory in the container
WORKDIR /workspace

# Provide a command for Cog usage
CMD ["cog"]