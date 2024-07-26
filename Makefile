lint:
	@shellcheck bin/*
	@echo "shellcheck: no lint found"
.PHONY: lint
