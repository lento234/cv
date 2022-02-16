CC=xelatex
DOCKERIMAGE=mrlento234/xelatex

all:
	docker run --rm \
	--user $(id -u):$(id -g) \
	-i -w "/doc" \
	-v "$(PWD)":/doc \
	$(DOCKERIMAGE) make cv


cv:
	@mkdir -p build
	$(CC) -output-directory=build cv.tex
	@mv -vf build/cv.pdf .


.PHONY: clean
clean:
	@rm -rf build
	@rm -vf cv.pdf


.PHONY: open
open:
	@xdg-open cv.pdf
