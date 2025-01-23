.PHONY: lint
lint:
	@echo "Linting..."
	golangci-lint run --config .golangci.yaml

.PHONY: format
format:
	@echo "Formatting..."
	golangci-lint run --fix --config .golangci.yaml
