# Minimal Docker image for FastQC v0.11.9 using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install FastQC
RUN apk update && \
    apk add bash openjdk8-jre-base perl zip && \
    wget "https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip" && \
    unzip fastqc_v0.11.9.zip && \
    sed -i 's/Xmx250m/Xmx1G/g' FastQC/fastqc && \
    sed -i 's/= 250 */= 1024 */g' FastQC/fastqc && \
    chmod a+x FastQC/fastqc && \
    mv FastQC /usr/local/bin/FastQC && \
    ln -s /usr/local/bin/FastQC/fastqc /usr/local/bin/fastqc && \
    rm fastqc_v0.11.9.zip
