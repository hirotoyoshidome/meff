.PHONY:	build	run

.SILENT:
build:
	nimble build

run:
	./measure_effect

