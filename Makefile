CC = xelatex
DOCKERIMAGE = mrlento234/xelatex
FILES = cv cv-extended

PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


all: ## Build all latex files using docker
	docker run --rm \
	--user="$(shell id -u):$(shell id -g)" \
	-i -w /doc \
	-v $(PWD):/doc \
	$(DOCKERIMAGE) make $(FILES) clean


cv: ## Compile CV
	@mkdir -p build
	$(CC) -output-directory=build cv.tex
	@mv -vf build/cv.pdf .


cv-extended: ## Compile CV-extended
	@mkdir -p build
	$(CC) -output-directory=build cv-extended.tex
	@mv -vf build/cv-extended.pdf .


coverletter: ## Compile Cover Letter
	@mkdir -p build
	$(CC) -output-directory=build coverletter.tex
	@mv -vf build/coverletter.pdf .


clean: ## Clean up
	@rm -rf build


.PHONY: purge
purge: clean  ## Purge all files
	@$(foreach var, $(FILES), rm -rv $(var).pdf;)


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
open: ## Open all pdf files
	@$(foreach var, $(FILES), open $(var).pdf;)
