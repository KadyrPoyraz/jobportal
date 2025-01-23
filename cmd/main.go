package main

import (
	"context"
	"log"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/KadyrPoyraz/jobportal/handlers"
	"github.com/KadyrPoyraz/jobportal/server"
)

func main() {
	s := server.NewServer(8080)

	s.Use(server.LoggingMiddleware)
	s.Use(server.RecoveryMiddleware)

	s.Router.GET("/", handlers.HomeHandler)

	stop := make(chan os.Signal, 1)
	signal.Notify(stop, os.Interrupt, syscall.SIGTERM)

	go func() {
		if err := s.Run(); err != nil {
			log.Fatalf("Error starting server: %v", err)
		}
	}()

	log.Println("Server is running on http://localhost:8080")

	<-stop

	log.Println("Shutting down server...")

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	if err := s.Shutdown(ctx); err != nil {
		log.Fatalf("Server forced to shutdown: %v", err)
	}

	log.Println("Server gracefully stopped")
}
