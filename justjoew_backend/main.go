package main

import (
	"context"
	"log"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	pb "justjoew/backend/protos"
	repository "justjoew/backend/src/respository"
)

type Item struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

type server struct {
	pb.UnimplementedAssetControllerServer
}

func (s *server) CreateSection(ctx context.Context, in *pb.CreateSectionRequest) (*pb.CreateSectionResponse, error) {
	log.Printf("Received: %v", in.GetName())
	repository.CreateSection(in.Name)
	return &pb.CreateSectionResponse{Name: "scattRat"}, nil
}

func main() {

	repository.InitDb()
	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	pb.RegisterAssetControllerServer(s, &server{})
	// Register reflection service on gRPC server.
	reflection.Register(s)
	log.Printf("Server listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
