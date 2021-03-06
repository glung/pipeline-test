AGENT_ROOT_PATH=/data/go-agent/$(shell date +"%s")

define DOCKER_RUN
docker run \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--interactive
endef

.PHONY: server
server:
	$(DOCKER_RUN) -d -p8153:8153 -p8154:8154 gocd/gocd-server:v17.3.0

.PHONY: agent
agent:
	@set -e ;\
	URL=$$(docker inspect --format='{{(index (index .NetworkSettings.IPAddress))}}' $(SERVER_NAME)); \
	PORT=$$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8154/tcp") 0).HostPort}}' $(SERVER_NAME)); \
	GO_SERVER_URL="https://$$URL:$$PORT/go"; \
	echo "Connecting to container ${SERVER_NAME} at $$GO_SERVER_URL"; \
	$(DOCKER_RUN) -d -e GO_SERVER_URL=$${GO_SERVER_URL} -v $(AGENT_ROOT_PATH):$(AGENT_ROOT_PATH) -e AGENT_ROOT_PATH=$(AGENT_ROOT_PATH) glung/gocd-agent-docker 

.PHONY: debug
debug: 
	@set -e ;\
	set -x ;\
	URL=$$(docker inspect --format='{{(index (index .NetworkSettings.IPAddress))}}' $(SERVER_NAME)); \
	PORT=$$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8154/tcp") 0).HostPort}}' $(SERVER_NAME)); \
	GO_SERVER_URL="https://$$URL:$$PORT/go"; \
	echo "Connecting to container ${SERVER_NAME} at $$GO_SERVER_URL"; \
	$(DOCKER_RUN) -t -e GO_SERVER_URL=$${GO_SERVER_URL} -v $(AGENT_ROOT_PATH):$(AGENT_ROOT_PATH) -e AGENT_ROOT_PATH=$(AGENT_ROOT_PATH) glung/gocd-agent-docker /bin/bash
