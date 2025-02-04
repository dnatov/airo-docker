# Use a Miniconda base image
FROM continuumio/miniconda3

# Set the working directory inside the container
WORKDIR /workspace

# Expose port for Meshcat Visualizations
EXPOSE 7000

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    nano

# Clone the airo-mono repository
RUN git clone https://github.com/airo-ugent/airo-mono.git

# Change to the repository directory
WORKDIR /workspace/airo-mono

# Create the Conda environment from the environment.yaml file
RUN conda env create -f environment.yaml

# Activate the environment by default
SHELL ["conda", "run", "-n", "airo-env", "/bin/bash", "-c"]