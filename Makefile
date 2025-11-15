.PHONY: cpp-ubuntu-25.04 cpp-ubuntu-16.04 cpp golang

cpp-ubuntu-25.04:
	docker build ./cpp-ubuntu-25.04 -t notkaramel/grpc-cpp:ubuntu-25.04

cpp-ubuntu-16.04:
	docker build ./cpp-ubuntu-16.04 -t notkaramel/grpc-cpp:ubuntu-16.04


push-cpp:
	docker push notkaramel/grpc-cpp:latest

golang:
	docker build ./golang -t notkaramel/grpc-golang:latest