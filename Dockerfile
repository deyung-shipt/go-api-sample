FROM golang:latest as build

RUN mkdir /source

WORKDIR /source

COPY . .

RUN go build

FROM alpine:latest

RUN apk --no-cache add ca-certificates

EXPOSE 8080

COPY --from=build /source/go-api-sample /usr/local/bin/go-api-sample
