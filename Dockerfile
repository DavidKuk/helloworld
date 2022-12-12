# The default golang version is 1.15
ARG GOLANG_VERSION="1.15"

FROM golang:$GOLANG_VERSION
ENV WK_DIR=/go_app
RUN mkdir $WK_DIR
COPY . $WK_DIR
WORKDIR $WK_DIR
RUN echo $GOLANG_VERSION
RUN go mod init helloworld
RUN go build -v ./...
RUN go test -v ./...
CMD go run main.go