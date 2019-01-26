FROM golang:1.11.5 as builder

# Set the working directory to the buildapp directory
WORKDIR /buildapp

#RUN go get -d -v golang.org/x/net/html

#Copy all contents from the root
COPY . .

#Build the go project
RUN GOOS=js GOARCH=wasm go build -o ./app/lib.wasm ./app/main.go

CMD ["go", "run", "./app/server.go"]