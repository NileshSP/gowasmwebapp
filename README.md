# Go & Wasm
Web app built using go and wasm

For building go in terminal one:
 `$Env:GOOS="js"; $Env:GOARCH="wasm"; go build -o ./app/lib.wasm ./app/main.go`

For running server in terminal two:
 `go run ./app/server.go`

 Open link [http://localhost:8080/app](http://localhost:8080/app) in the browser
