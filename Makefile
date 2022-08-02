.PHONY:	build	run-with-build	help	test

.SILENT:
build:
	nimble build

correlation:
	nimble build && ./bin/meff correlation ./examples/sample.csv

graph:
	nimble build && ./bin/meff graph ./examples/sample.csv

help:
	./bin/meff help

deploy:
	sh install.sh

test:
	nimble test

