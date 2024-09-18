RESUMECLI := node_modules/resume-cli/build/main.js
OBJS := build/cv.html build/cv.pdf

.PHONY: $(OBJS)
all: $(OBJS)

test: $(RESUMECLI)
	$< validate

build:
	mkdir -p $@
build/cv.html: $(RESUMECLI) build
	$< export --format=html --theme=flat $@
build/cv.pdf: $(RESUMECLI) build
	$< export --format=pdf --theme=flat $@
