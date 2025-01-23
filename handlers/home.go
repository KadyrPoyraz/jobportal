package handlers

import (
	"fmt"
	"net/http"
)

func HomeHandler(w http.ResponseWriter, _ *http.Request) {
	fmt.Fprintln(w, "Hello from home!")
}
