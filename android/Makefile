.PHONY: clean
clean:
	./gradlew clean


.PHONY: static-analysis
static-analysis:
	./gradlew static-analysis


.PHONY: unit-tests
unit-tests:
	./gradlew test


.PHONY: integration-tests
integration-tests:
	./gradlew assembleAndroidTest connectedDebugAndroidTest


.PHONY: test
test: package unit-tests integration-tests


.PHONY: package
package: check-env
	./gradlew assemble 


.PHONY: publish
publish: package
	# TODO: STORE ARTIFACT


.PHONY: release
release: publish
	# TODO

.PHONY: check-env
check-env:
ifndef PACKAGE_VERSION 
	$(error PACKAGE_VERSION is undefined) 
endif
