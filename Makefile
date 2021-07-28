# Variables
DOCKERIMAGE=mrlento234/pandoc
BUILDDIR=build
FILENAME=README
CC=pandoc

all: docker

default: clean pdf html

clean:
	\rm -rvf $(BUILDDIR)

builddir:
	mkdir $(BUILDDIR) -p -v

pdf: builddir
	$(CC) $(FILENAME).md \
	$(CCFLAGS) \
	--to=latex \
	--output=$(BUILDDIR)/$(FILENAME).pdf

html: builddir
	$(CC) $(FILENAME).md \
	$(CCFLAGS) \
	--to=html5 \
    --output=$(BUILDDIR)/$(FILENAME).html

spellcheck:
	docker run --rm \
	--volume "`pwd`:/home" \
	--user `id -u`:`id -g` \
	$(DOCKERIMAGE) $(CC) \
	--lua-filter config/filters/spellcheck.lua \
	$(FILENAME).md

docker:
	docker run --rm \
	--volume "`pwd`:/home" \
	--user `id -u`:`id -g` \
	$(DOCKERIMAGE) make default

