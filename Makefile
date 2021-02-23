THEMES := direct elegant eloquent flat fresh slick spartacus-prime
RESUMECLI := node_modules/resume-cli/build/main.js

OBJS = $(patsubst %, build/cv.%.html, $(THEMES))
# OBJS = $(patsubst %, build/cv.%.html, $(THEMES)) $(patsubst %, build/cv.%.pdf, $(THEMES))

all: $(OBJS)

test: $(RESUMECLI)
	$< validate

build:
	mkdir -p $@

build/cv.%.html: $(RESUMECLI) build
	$< export --format=html --theme=$* $@

build/cv.%.pdf: $(RESUMECLI) build
	$< export --format=pdf --theme=$* $@
