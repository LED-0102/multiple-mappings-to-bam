docker build -f samtools.Dockerfile -t samtools-1.3 .
docker build -f run-bwa.Dockerfile -t bwa-samtools .
docker build -f run-smalt.Dockerfile -t smalt-samtools .
docker build -f zcat.Dockerfile -t zcat .
docker build -f gatk-bcftools-samtools.Dockerfile -t mpfs-gatk .
docker build -f bcftools.Dockerfile -t bcftools .
docker build -f bcf_2_pseudosequence.Dockerfile -t bcf_2_pseudosequence .
docker build -f bam_filter.Dockerfile -t bam_filter .