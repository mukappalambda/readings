help: ## Show help message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | column -s "##" -t

sync: ## Run uv sync
	@uv sync

serve-docs: sync ## Serve the mkdocs
	@uv run mkdocs serve -a localhost:9090