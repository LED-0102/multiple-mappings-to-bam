FROM python:2.7-slim

RUN apt-get update && \
    apt-get install -y build-essential zlib1g-dev libbz2-dev liblzma-dev procps
    
RUN pip install --no-cache-dir \
    numpy

RUN pip install --no-cache-dir \
    biopython==1.68 \
    pysam==0.12.0.1 

CMD ["/bin/bash"]