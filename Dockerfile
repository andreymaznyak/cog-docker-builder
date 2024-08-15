# Use the official Docker image as a parent image
FROM docker:24.0.5

# Install required system packages
RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    curl

# Install Python packages (if needed)
RUN pip install --upgrade pip setuptools wheel

# Install Cog
RUN curl -o /usr/local/bin/cog -L https://github.com/replicate/cog/releases/latest/download/cog_$(uname -s)_$(uname -m) \
    && chmod +x /usr/local/bin/cog

# Set the working directory in the container
WORKDIR /workspace

# Provide a command for Cog usage
CMD ["cog"]