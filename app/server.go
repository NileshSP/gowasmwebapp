package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
)

var (
	listen = flag.String("listen", GetPort(), "listen address")
	dir    = flag.String("dir", ".", "directory to serve")
)

// GetPort: Get the Port from the environment so we can run on Heroku
func GetPort() string {
	var port = os.Getenv("PORT")
	// Set a default port if there is nothing in the environment
	if port == "" {
		port = "8080"
		fmt.Println("INFO: No PORT environment variable detected, defaulting to " + port)
	}
	return ":" + port
}

func main() {
	flag.Parse()
	log.Printf("listening on %q...", *listen)
	log.Fatal(http.ListenAndServe(*listen, http.FileServer(http.Dir(*dir))))
}
