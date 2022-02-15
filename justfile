CC := "xelatex"
DOCKERIMAGE := "mrlento234/xelatex"
EXPORT_DIR := "build"
FILENAME := "cv"

# display help information
help:
    @just --list

# Build using docker image
build:
	@mkdir -p {{ EXPORT_DIR }}
	docker run --rm \
	--user $(id -u):$(id -g) \
	-i -w "/doc" \
	-v "$PWD":/doc \
	{{ DOCKERIMAGE }} {{ CC }}  -output-directory={{ EXPORT_DIR }} {{ FILENAME }}.tex
	@mv {{ EXPORT_DIR }}/{{ FILENAME }}.pdf .

# Clean up
clean:
	@rm -rf {{ EXPORT_DIR }}

# Open PDF
open:
	@xdg-open {{ FILENAME }}.pdf
