ARG GOLANG_VERSION="1.15"
ARG OS="ubuntu:20.04"
FROM $OS
ARG GOLANG_VERSION
ARG OS
RUN apt update && apt install -y curl && apt install -y git
RUN curl -LO https://go.dev/dl/go${GOLANG_VERSION}beta1.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GOLANG_VERSION}beta1.linux-amd64.tar.gz 
ENV GOROOT=/usr/local/go 
ENV GOPATH=${HOME}/go
ENV PATH=${GOPATH}/bin:${GOROOT}/bin:${PATH} 
ENV PATH=${PATH}:/usr/local/go/bin/ 
ENV WK_DIR=/go_app
RUN mkdir $WK_DIR
WORKDIR $WK_DIR
COPY . $WK_DIR
RUN go mod init helloworld && \
    go build -v ./... && \
    go test -v ./...
CMD go run main.go




# The default golang version is 1.15
#ARG GOLANG_VERSION="1.15"


#FROM golang:$GOLANG_VERSION
#ENV WK_DIR=/go_app
#RUN mkdir $WK_DIR
#COPY . $WK_DIR
#WORKDIR $WK_DIR
#RUN echo $GOLANG_VERSION
#RUN go mod init helloworld
#RUN go build -v ./...
#RUN go test -v ./...
#CMD go run main.go