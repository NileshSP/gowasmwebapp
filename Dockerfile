FROM golang:1.11.5 as builder

# Create the directory where the application will reside
#RUN mkdir /app

# Set the working directory to the buildapp directory
WORKDIR /buildapp

RUN go get -d -v golang.org/x/net/html
#Copy all contents from the root
COPY . .

#Build the go project
RUN GOOS=js GOARCH=wasm go build -o ./app/lib.wasm ./app/main.go

#Start the server
#RUN go run ./buildapp/server.go

FROM alpine
#Alpine is one of the lightest linux containers out there, only a few 4.15MB
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk*
# Set the working directory to the app directory
WORKDIR /app
#Copy the binary from the first image (builder) to the new alpine container
COPY --from=builder /buildapp/app /app

# Expose the application on port 8080.
EXPOSE 8080

# Set the entry point of the container to the application executable
#ENTRYPOINT /app
#CMD ["go", "run", "/app/server.go"]
CMD ["/app"]