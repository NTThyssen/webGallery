package main

import (
	"fmt"
	"net/http"
	"os/exec"
)
var imageList = map[string]bool{
	"justjoew":    true,
	"webgallery":  true,
}

func deployHandler(w http.ResponseWriter, r *http.Request) {
	queryParm :=  r.URL.Query().Get("servicename")
	
	if _, exists := imageList[queryParm]; !exists {
		http.Error(w, "servicename not allowed", http.StatusForbidden)
		return
	}

	fmt.Println("deployment of ", queryParm, " started")

	cmd := exec.Command("docker-compose", "-f", "../"+queryParm+"/docker-compose.yml", "pull", queryParm)

	output, err := cmd.CombinedOutput()

	if err != nil{
		http.Error(w, fmt.Sprintf("Error pulling service: %s\nOutput: %s", err, string(output)), http.StatusInternalServerError)
		return
	}


	cmd = exec.Command("docker-compose", "-f", "../"+queryParm+"/docker-compose.yml", "up", "-d")

    output, err = cmd.CombinedOutput()

    if err != nil{
		http.Error(w, fmt.Sprintf("Error deploying service: %s\nOutput: %s", err, string(output)), http.StatusInternalServerError)
		return
	}

	fmt.Printf("Output: %s\n", output)
	fmt.Fprintf(w, "Deployment output:\n%s", output)
}

func main() {
	
	http.HandleFunc("/deploy", deployHandler)

	fmt.Println("Starting server on 9301")

	err := http.ListenAndServe(":9301", nil)

	if err != nil {
		fmt.Printf("Error starting server: %s\n", err)
	}
}
