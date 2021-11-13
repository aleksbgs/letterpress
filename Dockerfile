FROM golang:1.15.7-buster

COPY go.mod go.sum /go/src/github.com/aleksbgs/letterpress/
WORKDIR /go/src/github.com/aleksbgs/letterpress
RUN go mod download
COPY . /go/src/github.com/aleksbgs/letterpress
RUN go build -o /usr/bin/letterpress github.com/aleksbgs/letterpress/

EXPOSE 8080 8080
ENTRYPOINT ["/usr/bin/letterpress"]