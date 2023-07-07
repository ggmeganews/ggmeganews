FROM golang:1.20-alpine AS build

WORKDIR /app

COPY main.go .

RUN go build -o server main.go

FROM alpine:3.18.2

WORKDIR /app

COPY --from=build /app/server .

EXPOSE 8000

ENTRYPOINT ["/app/server"]
