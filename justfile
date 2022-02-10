DOCKERIMAGE := "mrlento234/pandoc"
CC := "pandoc"
CCFLAGS := "--defaults=config/defaults.yml"

FILENAME := "README"
EXPORTFILE := "cv"

# display help information
help:
    @just --list

# Make pdf from markdown
pdf: 
	{{ CC }} {{ FILENAME }}.md \
	{{ CCFLAGS }} \
	--to=latex \
	--output={{ EXPORTFILE }}.pdf

# Build using docker image
docker-build:
	docker run --rm \
	--volume "`pwd`:/home" \
	--user `id -u`:`id -g` \
	{{ DOCKERIMAGE }} make default

# Interact with docker image
docker-interact:
	docker run --rm -it \
	--volume "`pwd`:/home" \
	--user `id -u`:`id -g` \
	{{ DOCKERIMAGE }} sh