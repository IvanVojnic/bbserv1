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

RUN go install github.com/swaggo/swag/cmd/swag@latest
RUN swag init --parseDependency -g main.go

RUN go build -o /app/main

CMD [ "/main" ]

FROM alpine

WORKDIR /app

COPY --from=builder /app/main /app/main

EXPOSE 40000

CMD ["/app/main"]