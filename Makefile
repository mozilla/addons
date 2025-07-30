.PHONY: actionlint
actionlint: ## lint github action workflows
	docker compose -f docker-compose.tools.yml run --rm actionlint

.PHONY: zizmor
zizmor: ## run zizmor to check for security issues in GitHub Actions workflows
	docker compose -f docker-compose.tools.yml run --rm zizmor ./.github
