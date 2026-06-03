RESUMED := node_modules/resumed/bin/resumed.js
OBJS := build/cv.html build/cv.pdf

.PHONY: $(OBJS)
all: $(OBJS)

test:
	$(RESUMED) validate

build:
	mkdir -p $@
build/cv.html: resume.json build
	$(RESUMED) render --theme=jsonresume-theme-thekevjames --output=$@ $<
build/cv.pdf: resume.json build
	$(RESUMED) export --theme=jsonresume-theme-thekevjames --output=$@ $<
