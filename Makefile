.PHONY: cpp-ubuntu-25.04 cpp-ubuntu-16.04 golang

cpp-ubuntu-25.04:
	docker build ./cpp-ubuntu-25.04 -t notkaramel/grpc-cpp:ubuntu-25.04

cpp-ubuntu-16.04:
	docker build ./cpp-ubuntu-16.04 -t notkaramel/grpc-cpp:ubuntu-16.04

golang:
	docker build ./golang -t notkaramel/grpc-golang:latest