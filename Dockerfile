# Use Python 3.10 image base
FROM python:3.10-bookworm

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

# Update Pip
RUN pip install --upgrade pip

# Install all airo-mono packages in edit version from the git repo
RUN pip install -e /workspace/airo-mono/airo-typing \
    && pip install -e /workspace/airo-mono/airo-spatial-algebra \
	&& pip install -e /workspace/airo-mono/airo-dataset-tools \
	&& pip install -e /workspace/airo-mono/airo-camera-toolkit \
	&& pip install -e /workspace/airo-mono/airo-robots \
    && pip install -e /workspace/airo-mono/airo-teleop
	
# Default command to keep the container running
CMD ["python"]