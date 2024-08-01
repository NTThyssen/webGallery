package main

import (
	"context"
	pb "justjoew/backend/protos"
	"log"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

type Item struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

type server struct {
	pb.UnimplementedGreeterServer
}

func (s *server) SayHello(ctx context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	log.Printf("Received: %v", in.GetName())
	return &pb.HelloReply{Message: "Hello " + in.GetName()}, nil
}

func main() {

	creds, err := credentials.NewServerTLSFromFile("../certs/server.crt", "../certs/server.key")
	if err != nil {
		log.Fatalf("Failed to load TLS credentials: %v", err)
	}

	// Create a gRPC server object
	s := grpc.NewServer(grpc.Creds(creds))

	// Register your service with the server
	pb.RegisterGreeterServer(s, &server{})

	// Listen on port 50051
	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatalf("Failed to listen: %v", err)
	}

	log.Println("gRPC server is running on port 50051 with TLS")
	if err := s.Serve(lis); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}
