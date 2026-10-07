# Minimal Docker image for FastQC using Alpine base
FROM alpine:latest

# install FastQC
RUN apk update && \
    apk add --no-cache bash openjdk8-jre-base perl zip && \
    wget "https://github.com/s-andrews/FastQC/releases/download/v0.13.0/fastqc_v0.13.0.zip" && \
    unzip fastqc_*.zip && \
    sed -i 's/Xmx250m/Xmx1G/g' FastQC/fastqc && \
    sed -i 's/= 250 */= 1024 */g' FastQC/fastqc && \
    chmod a+x FastQC/fastqc && \
    mv FastQC /usr/local/bin/FastQC && \
    ln -s /usr/local/bin/FastQC/fastqc /usr/local/bin/fastqc && \
    rm fastqc_*.zip
