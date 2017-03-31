CDTOOLS_PATH=../cdtools

BUILD_DIR=./app/build/outputs/apk
BUILD_USER_APP_NAME=com.glung.android-app-release.apk
BUILD_INTRUMENTATION_APP_PATH_APP_NAME=app-debug-androidTest.apk

current_dir = $(shell pwd)
CONTAINER_RUN=$(CDTOOLS_PATH)/container-run -e GRADLE_USER_HOME="$(current_dir)/.gradle" -e ANDROID_HOME="$(current_dir)/.android" glung/android-sdk 

.PHONY: clean
clean:
	$(CONTAINER_RUN) /bin/bash -c "echo "CONTAINER"; pwd ; ls ; bin/set-up-android-sdk-env; ./gradlew clean"


.PHONY: static-analysis
static-analysis:
	$(CONTAINER_RUN) /bin/bash -c "bin/set-up-android-sdk-env; ./gradlew lint"


.PHONY: unit-tests
unit-tests:
	# TODO : run on device
	$(CONTAINER_RUN) /bin/bash -c "bin/set-up-android-sdk-env; ./gradlew test"

.PHONY: build
buid: build-release-app build-instrumentation-app


.PHONY: build-release-app
build-release-app: 
	$(CONTAINER_RUN) /bin/bash -c "bin/set-up-android-sdk-env; ./gradlew assembleRelease"


.PHONY: build-instrumentation-app
build-instrumentation-app: 
	$(CONTAINER_RUN) /bin/bash -c "bin/set-up-android-sdk-env; ./gradlew assembleAndroidTest"


.PHONY: layout-package
layout-package: 
	$(CDTOOLS_PATH)/clean
	$(CDTOOLS_PATH)/add_file $(BUILD_DIR)/$(BUILD_USER_APP_NAME)
	$(CDTOOLS_PATH)/add_file $(BUILD_DIR)/$(BUILD_INTRUMENTATION_APP_PATH_APP_NAME)
	$(CDTOOLS_PATH)/add_file bin


.PHONY: package
package: layout-package


.PHONY: publish
publish: 
	$(CDTOOLS_PATH)/publish


.PHONY: create-integration-device
create-integration-device: 
	# TODO
	# - pull (clean) AVD image
	# - start it


.PHONY: destroy-integration-device
destroy-integration-device: 
	# TODO


.PHONY: deploy-integration
deploy-integration: 
	$(CDTOOLS_PATH)/run "bin/deploy-integration"


.PHONY: run-integration-tests
run-integration-tests:
	$(CDTOOLS_PATH)/run "bin/run-integration-tests"


.PHONY: integration-tests
integration-tests: create-integration-device deploy-integration run-integration-tests destroy-integration-device
	

.PHONY: promote-to-stable
promote-to-stable: 
	$(CDTOOLS_PATH)/promote stable


.PHONY: promote-to-release
promote-to-release: 
	$(CDTOOLS_PATH)/promote release


.PHONY: run-container
run-container:
	$(CONTAINER_RUN) /bin/bash 

