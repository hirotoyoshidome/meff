.PHONY:	build	run	help	test

.SILENT:
build:
	nimble build

run:
	./bin/menim correlation

help:
	./bin/menim help

test:
	nimble test

