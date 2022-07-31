.PHONY:	build	run	test

.SILENT:
build:
	nimble build

run:
	./measure_effect

test:
	nimble test

