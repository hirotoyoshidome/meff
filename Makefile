.PHONY:	build	run	help	test

.SILENT:
build:
	nimble build

run:
	./bin/measure_effect correlation

help:
	./bin/measure_effect

test:
	nimble test

