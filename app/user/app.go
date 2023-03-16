package main

import (
	"net/http"
	"io"
)

func main() {
	http.HandleFunc("/get", getUser)
	http.HandleFunc("/post", postUser)
	http.ListenAndServe(":9081", nil)
}

func getUser(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "Hello getUser!")
}

func postUser(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "Hello postUser!")
}