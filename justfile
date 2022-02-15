CC := "xelatex"
DOCKERIMAGE := "thomasweise/texlive"
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

# Clean up
clean:
	@rm -rf {{ EXPORT_DIR }}

# Open PDF
open:
	@xdg-open {{ EXPORT_DIR }}/{{ FILENAME }}.pdf
