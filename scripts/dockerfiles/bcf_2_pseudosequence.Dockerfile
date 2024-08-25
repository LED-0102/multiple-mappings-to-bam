# FROM quay.io/ssd28/gsoc-experimental/samtools:1.3
FROM quay.io/ssd28/gsoc-experimental/samtools:1.3

RUN apt-get update && \
    apt-get install -y build-essential zlib1g-dev libbz2-dev liblzma-dev python2 pip procps
    
RUN apt-get update && apt-get install -y --no-install-recommends \
    bcftools

RUN pip install --no-cache-dir \
    numpy \
    biopython==1.68

CMD ["/bin/bash"]