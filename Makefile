deploy-debug:
	@docker compose config

deploy:
	@docker compose up -d

shutdown:
	@docker compose down

destroy:
	@docker compose down -v

.PHONY: deploy destroy shutdown deploy-debug

tooling-build-protoc-image:
	@docker build -t ryme/tool-protoc:latest --target final ./tooling/protoc/

tooling-push-protoc-image:
	@docker push ryme/tool-protoc:latest

.PHONY: tooling-build-protoc-image tooling-push-protoc-image
