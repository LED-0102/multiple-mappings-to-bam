FROM python:2.7-slim

# RUN apt-get install procps
RUN apt-get update && \
    apt-get install -y procps

RUN pip install --no-cache-dir \
    pysam==0.12.0.1

CMD ["/bin/bash"]