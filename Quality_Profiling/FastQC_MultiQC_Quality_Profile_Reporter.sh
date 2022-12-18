#!/bin/bash
# FastQC version=v0.11.9
# MultiQC version=1.11

#cd fastq_files
FILE_EXTENTION_RAW=fastq.gz
FILE_LIST_RAW=$(for file in *.$FILE_EXTENTION_RAW; do echo -n "$file "; done)
THREADS=$(cat /proc/cpuinfo | grep processor | wc -l)

mkdir FastQC_Quality_Reports
mkdir MultiQC_Quality_Reports
fastqc -t $THREADS --outdir FastQC_Quality_Reports $FILE_LIST_RAW
multiqc FastQC_Quality_Reports --outdir MultiQC_Quality_Reports --filename QUAL_REP
