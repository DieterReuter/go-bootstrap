FROM golang:1.7.4

# Install build dependencies
RUN apt-get update && apt-get install -y \
  bzip2 \
  --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY build-go-bootstrap.sh /
CMD ["/build-go-bootstrap.sh"]
