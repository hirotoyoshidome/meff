.PHONY:	build	run-with-build	help	test

.SILENT:
build:
	nimble build

run-with-build:
	nimble build && ./bin/menim correlation

help:
	./bin/menim help

test:
	nimble test

