.PHONY:	thishelp	build	correlation	graph	graph-settingfile	help	deploy	test

.SILENT:
thishelp:
	echo "This is development only use."

build:
	nimble build

correlation:
	nimble build && ./bin/meff correlation ./examples/sample.csv

graph:
	nimble build && ./bin/meff graph ./examples/sample.csv

graph-settingfile:
	nimble build && ./bin/meff graph ./examples/sample.csv --setting-file settings.json

help:
	./bin/meff help

deploy:
	sh install.sh

test:
	nimble test
