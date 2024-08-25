# USAGE

## Overview

This document provides a concise guide to using the CLI for configuring and running the Nextflow pipeline. The CLI accepts various parameters that control different aspects of the pipeline, from reference genome selection to mapping configurations.

## Command syntax

````sh
nextflow run scripts/main.nf --ref ref.fa --program BWA --domapping True --human False --pairedend True --maxinsertsize 1000 --mininsertsize 50 --ssahaquality 30 --maprepeats False --GATK True --markdup True --detectOverlaps False --pseudosequence True --incref True --indels True --quality 50 --mapq 20 --depth 8 --stranddepth 3 --anomolous True --BAQ True --circular True --ratio 0.8 --prior 0.001 --call c --output Streptococcus_agalactiae_NGBS128_GCF_001552035_1_bwa --force False --filter 1 --tabfile False --alnfile False --raxml False --model GTRGAMMA --bootstrap 100 --keep False --LSF True --LSFQ normal --mem 5 --nodes 20 --dirty False --mapfiles "31663_7#10_1.fastq.gz,31663_7#10_2.fastq.gz,31663_7#12_1.fastq.gz,31663_7#12_2.fastq.gz" -process.echo -resume -profile docker
````

## Options and Parameters

### Required Options

**-r, --reference**  
**Help**: Reference DNA sequence (in fasta or multi-fasta format)  
**Values**: FILE  
**Default**: "" (empty string)  

### Mapping Options  

**-p, --program**  
**Help**: Mapping program to use  
**Values**: bwa, ssaha, smalt  
**Default**: bwa  

**-1, --nomap**  
**Help**: Do not remap data - only available when input is BAM (default is to map)  
**Values**: True/False  
**Default**: True  

**-H, --human**  
**Help**: Mapping against human (or other large eukaryotes)  
**Values**: N/A  
**Default**: False

**-s, --single**  
**Help**: Reads are single-ended (not paired)  
**Values**: N/A  
**Default**: True  

**-i, --maxinsert**  
**Help**: Maximum insert size (for ssaha and smalt only)  
**Values**: INT  
**Default**: 1000  

**-j, --mininsert**  
**Help**: Minimum insert size (for ssaha and smalt only)  
**Values**: INT  
**Default**: 50

-S, --ssahaquality
Help: Minimum ssaha quality score while mapping (ssaha only)
Values: INT
Default: 30
-E, --maprepeats

Help: Randomly map repeats when using SMALT (default is to not map repeats)
Values: N/A
Default: False
-z, --nomapid

Help: Minimum identity threshold to report a mapping (smalt only)
Values: FLOAT
Default: 0
-G, --GATK

Help: Turn off GATK indel realignment (highly recommended to use GATK indel realignment)
Values: N/A
Default: True
-u, --MarkDuplicates

Help: Turn off Picard MarkDuplicates
Values: N/A
Default: True
-2, --detect-overlaps

Help: Enable read-pair overlap detection in mpileup
Values: N/A
Default: False
Pseudosequence Creation Options
-X, --dna

Help: Do not create pseudosequences
Values: N/A
Default: True
-x, --noref

Help: Do not include reference in pseudosequence alignment
Values: N/A
Default: True
-I, --indels

Help: Do not include small indels in pseudosequence alignment
Values: N/A
Default: True
-q, --quality

Help: Minimum base call quality to call a SNP
Values: INT
Default: 50
-Q, --mapq

Help: Minimum mapping quality to call a SNP
Values: INT
Default: 20
-d, --depth

Help: Minimum number of reads matching SNP
Values: INT
Default: 8
-D, --stranddepth

Help: Minimum number of reads matching SNP per strand
Values: INT
Default: 3
-A, --dontuseanomolous

Help: Do not use anomalous reads in mpileup
Values: N/A
Default: True
-B, --BAQ

Help: Turn off samtools base alignment quality option (BAQ)
Values: N/A
Default: True
-c, --circular

Help: Contigs are not circular, so do not try to fix them
Values: N/A
Default: True
-R, --ratio

Help: SNP/Mapping quality ratio cutoff
Values: FLOAT
Default: 0.8
-P, --prior
