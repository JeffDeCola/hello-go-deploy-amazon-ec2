# hello-go-deploy-amazon-ec2 Dockerfile used to build docker image

# Multi-stage build to create a small docker image

#################################
# STAGE 1 build executable binary
#################################

FROM golang:alpine AS builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

# SET WORKING DIRECTORY AND PLACE YOUR CODE IN
WORKDIR $GOPATH/src/github.com/jeffdecola/hello-go-deploy-amazon-ec2/
COPY . .

# CHECK
RUN ls -lat $GOPATH/src/github.com/jeffdecola/hello-go-deploy-amazon-ec2/

# Fetch dependencies using go get.
RUN go get -d -v

# Build the binary.
RUN go build -o /go/bin/hello-go-deploy-amazon-ec2 main.go

###############################
# STAGE 2 build a smaller image
###############################

FROM alpine

# Add my name to it
LABEL maintainer="Jeff DeCola https://github.com/JeffDeCola/hello-go-deploy-amazon-ec2"

# Put the binary from previous build into /app
RUN mkdir /app
COPY --from=builder /go/bin/hello-go-deploy-amazon-ec2 /app/hello-go-deploy-amazon-ec2
WORKDIR /app

# Add the ailibty to /bin/bash in alpine
RUN apk add --update bash

# Run the binary.
ENTRYPOINT ["/app/hello-go-deploy-amazon-ec2"]
