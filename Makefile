help: ## Show help message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | column -s "##" -t

install: ## Run poetry install
	@poetry install

serve-docs: install ## Serve the mkdocs
	@poetry run mkdocs serve -a localhost:9090
