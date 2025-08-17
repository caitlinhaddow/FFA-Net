# Use the official Conda base image with Python 3.7
FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime

# Set working directory
WORKDIR /FFA-Net/net

# required for opencv
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y  

RUN pip install "numpy<2" matplotlib

COPY . .

ENTRYPOINT ["python"]
# ENTRYPOINT ["bash", "-c"]
