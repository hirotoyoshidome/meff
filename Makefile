.PHONY:	build	run-with-build	help	test

.SILENT:
build:
	nimble build

run-with-build:
	nimble build && ./bin/meff correlation

help:
	./bin/meff help

test:
	nimble test

