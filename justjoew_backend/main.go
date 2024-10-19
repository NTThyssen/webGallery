package main

import (
	"context"
	"fmt"
	"log"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	pb "justjoew/backend/protos"
	blobRepository "justjoew/backend/src/blob_repository"
	repository "justjoew/backend/src/respository"
)

type Item struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

type server struct {
	pb.UnimplementedAssetControllerServer
}

func (s *server) CreateAsset(ctx context.Context, in *pb.CreateAssetRequest) (*pb.CreateAssetResponse, error) {
	log.Printf("Received: %v", in.SectionId)
	res, err := repository.CreateAsset(in)
	if err != nil {
		return nil, err
	}
	return &pb.CreateAssetResponse{Asset: &pb.Asset{Id: uint32(res.ID), SectionName: res.Section.Name, BlobPath: fmt.Sprintf("%s/%d", res.BlobPath, 512), OrderIndex: res.OrderIndex, SectionId: res.SectionID}}, nil
}

func (s *server) DeleteSection(ctx context.Context, in *pb.DeleteSectionRequest) (*pb.DeleteSectionResponse, error) {
	log.Printf("Received: %v", in.GetSectionId())
	err := repository.DeleteSection(in.GetSectionId())
	return &pb.DeleteSectionResponse{}, err
}

func (s *server) DeleteAsset(ctx context.Context, in *pb.DeleteAssetRequest) (*pb.DeleteAssetResponse, error) {
	log.Printf("Received: %v", in.GetAssetId())
	err := repository.DeleteSection(in.GetAssetId())
	return &pb.DeleteAssetResponse{}, err
}

func (s *server) CreateSection(ctx context.Context, in *pb.CreateSectionRequest) (*pb.CreateSectionResponse, error) {
	log.Printf("Received: %v", in.GetName())
	res, err := repository.CreateSection(in.Name)
	return &pb.CreateSectionResponse{Name: res}, err
}

func (s *server) GetAllSections(ctx context.Context, in *pb.GetAllSectionsRequest) (*pb.GetAllSectionsResonse, error) {
	log.Printf("Received: get all requets")
	res, err := repository.GetAllSections()
	if err != nil {
		log.Panicln(err.Error())
		return nil, err
	}

	var sections []*pb.Section

	for _, section := range res {
		section := &pb.Section{
			Id:        uint32(section.ID),
			Name:      section.Name,
			AssetList: mapAssetsToResponse(section.AssetList),
		}
		sections = append(sections, section)
	}

	return &pb.GetAllSectionsResonse{Sections: sections}, nil
}

func mapAssetsToResponse(assets []repository.Asset) []*pb.Asset {
	var resAssetList []*pb.Asset
	for _, asset := range assets {
		resAsset := &pb.Asset{
			Id:          uint32(asset.ID),
			SectionName: asset.Section.Name,
			BlobPath:    blobRepository.CreatePreSignedUrls(asset.BlobPath),
			OrderIndex:  asset.OrderIndex,
			SectionId:   asset.SectionID,
		}
		resAssetList = append(resAssetList, resAsset)
	}
	return resAssetList
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
