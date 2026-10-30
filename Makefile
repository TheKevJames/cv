RESUMED := bun x resumed
OBJS := build/cv.html build/cv.pdf build/cv-page-1.png build/cv-page-2.png

.PHONY: all test build clean $(OBJS)
all: $(OBJS)

test:
	$(RESUMED) validate

build: $(OBJS)

build/cv.html: resume.json
	mkdir -p build
	$(RESUMED) render --theme=jsonresume-theme-thekevjames --output=$@ $<
build/cv.pdf: resume.json
	mkdir -p build
	$(RESUMED) export --theme=jsonresume-theme-thekevjames --output=$@ $<
build/cv-page-1.png build/cv-page-2.png: build/cv.pdf
	uv run --with pymupdf python3 -c "import pymupdf; doc = pymupdf.open('build/cv.pdf'); [page.get_pixmap(dpi=150).save(f'build/cv-page-{i+1}.png') for i, page in enumerate(doc)]"

clean:
	rm -rf build
