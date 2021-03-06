FROM golang:1.8

RUN wget http://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl -O /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

ADD . /go/src/app/

RUN go-wrapper download
RUN go-wrapper install

CMD ["app"]
