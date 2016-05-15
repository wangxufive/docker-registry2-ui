DEPS=go list -f '{{range .TestImports}}{{.}} {{end}}' ./...

.PHONY: run
run:
	go run main.go

.PHONY: build
build: clean install-deps vet test
	go install -v ./...
	cp '$(GOPATH)/bin/docker-registry2-ui' .

.PHONY: update-deps
update-deps:
	rm -rf Godeps
	go get -u -v github.com/tools/godep
	godep save ./...

.PHONY: install-deps
install-deps: update-deps
	godep restore
	$(DEPS) | xargs -n1 go get -u -v -d

.PHONY: vet
vet:
	go vet -n -x -v ./...

.PHONY: fmt
fmt:
	bash -c 'go list ./... | grep -v vendor | xargs -n1 go fmt'

.PHONY: test
test:
	bash -c 'go list ./... | grep -v vendor | xargs -n1 go test -v -race -covermode=count -coverprofile=coverage.out -timeout=30s'

.PHONY: clean
clean:
	go clean -i ./...

.PHONY: clean-mac
clean-mac: clean
	find . -name ".DS_Store" -print0 | xargs -0 rm
