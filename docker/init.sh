#!/bin/bash

go mod init run-app

go get go.mongodb.org/mongo-driver/bson
go get go.mongodb.org/mongo-driver/mongo
go get go.mongodb.org/mongo-driver/mongo/options
go get go.mongodb.org/mongo-driver/bson

go build
