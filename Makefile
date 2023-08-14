RESUMECLI := node_modules/resume-cli/build/main.js

all: build/cv.html
# all: build/cv.html build/cv.pdf

test: $(RESUMECLI)
	$< validate

build:
	mkdir -p $@

build/cv.html: $(RESUMECLI) build
	$< export --format=html --theme=direct $@

build/cv.pdf: $(RESUMECLI) build
	# TODO: fixme
	$< export --format=pdf --theme=direct $@
