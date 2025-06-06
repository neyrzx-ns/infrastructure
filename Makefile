deploy-debug:
	@docker compose config

deploy:
	@docker compose up -d

shutdown:
	@docker compose down

destroy:
	@docker compose down -v

tooling-build-protoc-image:
	@docker build -t tool-protoc:latest --target final ./tooling/protoc/

.PHONY: deploy destroy shutdown deploy-debug
