# Use Debian bookworm as the base image
FROM debian:bookworm

WORKDIR /

# download and install Miniconda
RUN mkdir -p ~/miniconda3
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
RUN bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
RUN rm ~/miniconda3/miniconda.sh

RUN apt-getupdate -y && apt install vim -y

# Clone the python-helloworld repository into the container
RUN git clone https://github.com/dbarnett/python-helloworld /python-helloworld

# Set working directory to the cloned repository
RUN git repo /python-helloworld

