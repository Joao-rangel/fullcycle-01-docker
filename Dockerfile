FROM golang:1.20-alpine AS build

WORKDIR /app

RUN go mod init go-hello && \
    go mod download

COPY . .

RUN go build -o hello .

FROM scratch

COPY --from=build /app/hello .

CMD ["./hello"]
