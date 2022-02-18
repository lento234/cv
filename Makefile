CC=xelatex
DOCKERIMAGE=mrlento234/xelatex

PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

all: ## Build all latex files using docker
	docker run --rm \
	--user $(id -u):$(id -g) \
	-i -w "/doc" \
	-v "$(PWD)":/doc \
	$(DOCKERIMAGE) make cv


cv: ## Compile CV
	@mkdir -p build
	$(CC) -output-directory=build cv.tex
	@mv -vf build/cv.pdf .


.PHONY: clean
clean: ## Clean up
	@rm -rf build
	@rm -vf cv.pdf

.PHONY: install-apt-deps
install-apt-deps: ## Install dependencies
	@sudo apt update
	@sudo apt install -y \
		texlive \
		texlive-base \
		texlive-fonts-extra \
		texlive-fonts-recommended \
		texlive-lang-english \
		texlive-lang-german \
		texlive-science \
		texlive-xetex


.PHONY: open
open: ## Open CV pdf
	@xdg-open cv.pdf
