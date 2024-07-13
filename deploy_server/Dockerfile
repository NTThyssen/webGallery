FROM golang:1.22 as build

RUN apt-get update && apt-get install -y \
    docker.io \
    curl \
    && curl -L "https://github.com/docker/compose/releases/download/v2.26.0/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

COPY . .

RUN go mod download

RUN CGO_ENABLED=0 go build -o /app

#FROM gcr.io/distroless/static-debian11

#COPY --from=build /go/bin/app /
CMD ["/app"]