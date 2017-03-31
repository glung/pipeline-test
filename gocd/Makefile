.PHONY: server
server:
	../cdtools/container-run -d --rm -p8153:8153 -p8154:8154 --volume=/Users/guillaume/Dropbox/Developpement/Repositories/pipeline-tests:/server/repo gocd/gocd-server:v17.3.0

.PHONY: agent
agent:
	@set -e ;\
	URL=$$(docker inspect --format='{{(index (index .NetworkSettings.IPAddress))}}' $(SERVER_NAME)) ;\
	PORT=$$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8154/tcp") 0).HostPort}}' $(SERVER_NAME)) ;\
	echo "Connecting to container ${SERVER_NAME} at $$URL:$$PORT" ;\
	../cdtools/container-run -d -v /tmp:/tmp --volume=/Users/guillaume/Dropbox/Developpement/Repositories/pipeline-tests:/server/repo -e GO_SERVER_URL=https://$$URL:$$PORT/go glung/gocd-agent-docker

.PHONY: debug
debug:
	@set -e ;\
	URL=$$(docker inspect --format='{{(index (index .NetworkSettings.IPAddress))}}' $(SERVER_NAME)) ;\
	PORT=$$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8154/tcp") 0).HostPort}}' $(SERVER_NAME)) ;\
	echo "Connecting to container ${SERVER_NAME} at $$URL:$$PORT" ;\
	../cdtools/container-run -t -v /tmp:/tmp --volume=/Users/guillaume/Dropbox/Developpement/Repositories/pipeline-tests:/server/repo -v /tmp:/opt/workspace -e GO_SERVER_URL=https://$$URL:$$PORT/go glung/gocd-agent-docker /bin/bash

