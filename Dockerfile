#Using container build at remote & publish
#On heroku.com (free hosting services) build docker container at remote(in heroku platform) and publish app
#create heroku app using browser login
#using heroku CLI in the root directory of the project execute following commands
#add heroku.yml file in the root with required commands
#git add heroku.yml
#git commit -m 'added heroku file'
#git push origin master
#heroku login
#heroku git:remote -a gowasmfacerecognition
#heroku buildpacks:set https://github.com/jincod/dotnetcore-buildpack (if required)
#heroku buildpacks:add --index 1 heroku/nodejs (if required)
#heroku buildpacks -- check for registered buildpacks for the repository/project
#heroku stack:set container
#git subtree push --prefix gowasmfacerecognition heroku master  OR  git push heroku master  OR  git push -f heroku master

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