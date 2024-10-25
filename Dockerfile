FROM ubuntu:20.04

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    git \
    wget \
    tar \
    python3 \
    gcc \
    g++ \
    make \
    bison \
    flex \
    gawk \
    chrpath \
    diffstat \
    unzip \
    texinfo \
    zlib1g-dev \
    libsdl1.2-dev \
    xterm \
    locales \
    cpio \
    lz4 \
    zstd \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Generate locales
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

# Create a non-root user and switch to it
RUN useradd -ms /bin/bash builduser

# Set the working directory
WORKDIR /home/builduser/workdir

# Switch to the non-root user
USER builduser

# Add the working directory as a safe directory in Git
RUN git config --global --add safe.directory /home/builduser/workdir

# Optionally, you can add any additional setup commands here