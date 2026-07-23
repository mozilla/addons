.PHONY: actionlint
actionlint: ## lint github action workflows
	docker compose -f docker-compose.tools.yml run --rm actionlint
