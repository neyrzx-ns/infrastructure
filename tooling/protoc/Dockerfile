FROM golang:alpine AS protoc
RUN go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest && \
    go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest && \
    go install google.golang.org/protobuf/cmd/protoc-gen-go@latest && \
    wget -O /tmp/protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v31.1/protoc-31.1-linux-x86_64.zip && \
    unzip /tmp/protoc.zip -d /usr/ && \
    rm /tmp/protoc.zip && \
    mkdir -p /usr/include/google/api && \
    wget -O /usr/include/google/api/annotations.proto https://raw.githubusercontent.com/googleapis/googleapis/refs/heads/master/google/api/annotations.proto && \
    wget -O /usr/include/google/api/http.proto https://raw.githubusercontent.com/googleapis/googleapis/refs/heads/master/google/api/http.proto

FROM alpine:latest AS final
COPY --from=protoc /go/bin/protoc-gen-grpc-gateway /usr/bin/protoc-gen-grpc-gateway
COPY --from=protoc /go/bin/protoc-gen-openapiv2 /usr/bin/protoc-gen-openapiv2
COPY --from=protoc /go/bin/protoc-gen-go /usr/bin/protoc-gen-go
COPY --from=protoc /go/bin/protoc-gen-go-grpc /usr/bin/protoc-gen-go-grpc
COPY --from=protoc /usr/bin/protoc /usr/bin/protoc
COPY --from=protoc /usr/include/google/ /usr/include/google/
ENTRYPOINT ["protoc", "-I", "/usr/include/"]
