package main

import (
	"context"
	"log"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	pb "justjoew/backend/protos"
	repository "justjoew/backend/src/respository"
	blobRepository "justjoew/backend/src/blob_repository"

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
	res := repository.CreateAsset(in)
	return &pb.CreateAssetResponse{Asset: &pb.Asset{Id: uint32(res.ID), SectionName: res.Section.Name, BlobPath: res.BlobPath, OrderIndex: res.OrderIndex, SectionId: res.SectionID}}, nil
}

func (s *server) CreateSection(ctx context.Context, in *pb.CreateSectionRequest) (*pb.CreateSectionResponse, error) {
	log.Printf("Received: %v", in.GetName())
	repository.CreateSection(in.Name)
	return &pb.CreateSectionResponse{Name: "scattRat"}, nil
}

func (s *server) GetAllSections(ctx context.Context, in *pb.GetAllSectionsRequest) (*pb.GetAllSectionsResonse, error){
		log.Printf("Received: get all requets",)
	res, err := repository.GetAllSections();
	if err != nil {
		log.Panicln(err.Error())
		return nil, err
	}

	var sections []*pb.Section

	for _, section := range res {
		section := &pb.Section{
			Id: uint32(section.ID),
			Name: section.Name,
			AssetList: mapAssetsToResponse(section.AssetList),
		}
		sections = append(sections, section)
	}

	
	return &pb.GetAllSectionsResonse{Sections: sections }, nil
}

func mapAssetsToResponse(assets []repository.Asset) []*pb.Asset {
	var resAssetList []*pb.Asset
		for _, asset := range assets {
		resAsset := &pb.Asset{
			Id: uint32(asset.ID),
			SectionName: asset.Section.Name,
			BlobPath:  blobRepository.CreatePreSignedUrls(asset.BlobPath),
			OrderIndex: asset.OrderIndex,
			SectionId: asset.SectionID,
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
