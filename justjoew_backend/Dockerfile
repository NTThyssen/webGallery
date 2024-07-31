# Build stage
FROM golang:1.22.5 AS builder
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the Go server - adjust the path to your main Go file
RUN go build -o /app/server main.go

# Run stage
FROM gcr.io/distroless/base-debian12
WORKDIR /app

# Copy the executable from the builder stage
COPY --from=builder /app/server /app/server

# Command to run the executable
CMD ["/app/server"]