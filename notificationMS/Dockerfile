FROM golang:1.19 AS builder

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .

RUN go build -o /app/main

CMD [ "/main" ]

FROM alpine

WORKDIR /app

COPY --from=builder /app/main /app/main
COPY --from=builder /app/barbandappKey.json /app/barbandappKey.json

EXPOSE 5000

CMD ["/app/main"]