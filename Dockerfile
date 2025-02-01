# Use Debian bookworm as the base image
FROM debian:bookworm

# Update package list and install required tools: curl and git
RUN apt-get update && apt-get install -y curl git && rm -rf /var/lib/apt/lists/*

# Download and install Miniconda
RUN curl -o Miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x Miniconda.sh && \
    ./Miniconda.sh -b -p /opt/miniconda && \
    rm Miniconda.sh

# Add Miniconda to PATH
ENV PATH="/opt/miniconda/bin:$PATH"

# Clone the python-helloworld repository into the container
RUN git clone https://github.com/dbarnett/python-helloworld /python-helloworld

# Set working directory to the cloned repository
WORKDIR /python-helloworld
