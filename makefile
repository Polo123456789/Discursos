MARKDOWN_SRC := $(shell find . -name "*.md")
HTML_DST := $(MARKDOWN_SRC:.md=.html)
PDF_DST := $(MARKDOWN_SRC:.md=.pdf)

all: $(HTML_DST) $(PDF_DST)

%.html: %.md
	pandoc -s -o $@ $<

%.pdf: %.md
	pandoc -s -o $@ $<
