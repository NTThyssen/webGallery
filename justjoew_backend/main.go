package main

import (
	"context"
	"log"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	pb "justjoew/backend/protos"
	blobRepository "justjoew/backend/src/blob_repository"
	emailsender "justjoew/backend/src/email_sender"
	repository "justjoew/backend/src/respository"
)

type server struct {
	pb.UnimplementedAssetControllerServer
}

func (s *server) CreateAsset(ctx context.Context, in *pb.CreateAssetRequest) (*pb.CreateAssetResponse, error) {
	log.Printf("Received: %v", in.SectionId)
	res, err := repository.CreateAsset(in)
	if err != nil {
		log.Printf("error: %v", err.Error())
		return nil, err
	}
	return &pb.CreateAssetResponse{Asset: &pb.Asset{Id: uint32(res.ID), SectionName: res.Section.Name, BlobPath: res.BlobPath, OrderIndex: res.OrderIndex, SectionId: res.SectionID}}, nil
}


func (s *server) DeleteSection(ctx context.Context, in *pb.DeleteSectionRequest) (*pb.DeleteSectionResponse, error) {
	log.Printf("Received: %v", in.GetSectionId())
	err := repository.DeleteSection(in.GetSectionId())
	return &pb.DeleteSectionResponse{}, err
}

func (s *server) DeleteAsset(ctx context.Context, in *pb.DeleteAssetRequest) (*pb.DeleteAssetResponse, error) {
	log.Printf("Received: %v", in.GetAssetId())
	err := repository.DeleteAsset(in.GetAssetId())
	return &pb.DeleteAssetResponse{}, err
}

func (s *server) CreateSection(ctx context.Context, in *pb.CreateSectionRequest) (*pb.CreateSectionResponse, error) {
	log.Printf("Received: %v", in.GetName())
	res, err := repository.CreateSection(in.Name, in.SectionURL)
	return &pb.CreateSectionResponse{Section: &pb.Section{Name: res.Name, SectionUrl: res.SectionUrl}}, err
}

func (s *server) UpdateAssetOrder(ctx context.Context, in *pb.UpdateAssetOrderRequest) (*pb.UpdateAssetOrderResponse, error) {
	log.Printf("Method invoked: UpdateAssetOrder")
	res, err := repository.UpdateAssetOrder(in.Id, in.OrderIndex)
	return &pb.UpdateAssetOrderResponse{NewOrderIndex: res}, err
}

func (s *server) UpdateSectionOrder(ctx context.Context, in *pb.UpdateSectionOrderRequest) (*pb.UpdateSectionOrderResponse, error) {
	log.Printf("Received: %v", in.OrderIndex)
	res, err := repository.UpdateSectionOrder(in.Id, in.OrderIndex)
	return &pb.UpdateSectionOrderResponse{NewOrderIndex: res}, err
}

func (s *server) UpdateSectionInfo(ctx context.Context, in *pb.UpdateSectionInfoRequest) (*pb.UpdateSectionInfoResponse, error) {
	log.Printf("Received: %v", in.SectionUrl)
	res, err := repository.UpdateSectionInfo(in.Id, in.SectionName, in.SectionUrl)
	return &pb.UpdateSectionInfoResponse{SectionName: res.Name, SectionUrl: res.SectionUrl}, err
}

func (s *server) SendEmail(ctx context.Context, in *pb.SendEmailRequest) (*pb.Empty, error) {
	log.Printf("Received: %v", in.GetSubject())
	err := emailsender.SendEmail(in.GetSubject(), in.GetMessage(), in.GetEmail(), in.GetName())
	return &pb.Empty{}, err
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
			Id:         uint32(section.ID),
			Name:       section.Name,
			OrderIndex: section.OrderIndex,
			SectionUrl: section.SectionUrl,
			AssetList:  mapAssetsToResponse(section.AssetList, in.GetAspectRatio()),
		}
		sections = append(sections, section)
	}

	return &pb.GetAllSectionsResonse{Sections: sections}, nil
}

func mapAssetsToResponse(assets []repository.Asset, aspectRation uint32) []*pb.Asset {
	var resAssetList []*pb.Asset
	for _, asset := range assets {
		resAsset := &pb.Asset{
			Id:          uint32(asset.ID),
			SectionName: asset.Section.Name,
			BlobPath:    blobRepository.CreatePreSignedUrls(asset.BlobPath, aspectRation, asset.Format),
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
