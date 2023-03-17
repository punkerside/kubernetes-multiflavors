package main

import (
	"net/http"
	"io"
	"time"
	"context"
	"log"
	"fmt"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

var ctx, cancel = context.WithTimeout(context.Background(), 20*time.Second)


// funcion principal
func main() {

	http.HandleFunc("/post", postUser)
	http.HandleFunc("/get", getUser)
	http.ListenAndServe(":9081", nil)
}


// funcion de inserción
func postUser(w http.ResponseWriter, r *http.Request) {
	client, err := mongo.Connect(context.TODO(), options.Client().ApplyURI("mongodb://mongo:27017"))
	if err != nil {
	  log.Fatal("There was a connection error", err)
	}

	aDatabase := client.Database("Music")
	theCollection := aDatabase.Collection("New Music")

	insertResult, err := theCollection.InsertOne(ctx, bson.D{
		{"Name", "Moby"},
	})
	if err != nil {
		log.Println("There was an error in trying to migrate the data into the database")
	}
	fmt.Println(insertResult.InsertedID)

	io.WriteString(w, "Hello postUser!")
}


// funcion de consulta
func getUser(w http.ResponseWriter, r *http.Request) {

	client, err := mongo.Connect(context.TODO(), options.Client().ApplyURI("mongodb://mongo:27017"))
	if err != nil {
	  log.Fatal("There was a connection error", err)
	}
	
	aDatabase := client.Database("Music")
	theCollection := aDatabase.Collection("New Music")

	cursor, err := theCollection.Find(ctx, bson.M{})
	if err != nil {
	 log.Println(err)
	}

	var music []bson.M
	if err = cursor.All(ctx, &music); err != nil {
	 log.Println(err)
	}

	fmt.Print(music)
	fmt.Println(music)

	io.WriteString(w, "Hello postUser!")
}