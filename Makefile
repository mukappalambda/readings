help: ## Show help message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | column -s "##" -t

sync: ## Run uv sync
	@uv sync

serve-docs: sync ## Serve the doc site
	@uv run zensical serve -a localhost:9090
