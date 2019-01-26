# Get the Go with version as specified
FROM golang:1.11.5 as builder

# Set the working directory to the buildapp directory
WORKDIR /buildapp

# Copy all contents from the root
COPY ./app/ .

# Build the go project
RUN GOOS=js GOARCH=wasm go build -o lib.wasm main.go

# Start the server to listen for requests
CMD ["go", "run", "server.go"]