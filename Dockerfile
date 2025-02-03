# Use Debian bookworm as the base image
FROM debian:bookworm

# Update package list and install required tools: curl
RUN apk add curl

WORKDIR C:\Users\andre\OneDrive\Desktop\ECS198F\ecs198f_hw2_template

# download and install Miniconda
RUN mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

RUN source ~/miniconda3/bin/activate

RUN conda init --all

# Add Miniconda to PATH
ENV PATH="/opt/miniconda/bin:$PATH"

# Clone the python-helloworld repository into the container
RUN git clone https://github.com/dbarnett/python-helloworld /python-helloworld

# Set working directory to the cloned repository
WORKDIR /python-helloworld
