to generate golang protbuf :
protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative protos/justjoew.proto     

to generate dart:
 protoc --dart_out=grpc:. -Iprotos protos/justjoew.proto     