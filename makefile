MARKDOWN_SRC := $(shell find . -name "*.md")
HTML_DST := $(MARKDOWN_SRC:.md=.html)
PDF_DST := $(MARKDOWN_SRC:.md=.pdf)

INLINE_FOOTNOTES := pandoc/partials/inline-footnotes.html
REMOVE_FOOTNOTES := ./pandoc/lua/delete-footnotes.lua

all: $(HTML_DST) $(PDF_DST)

%.pdf: %.md
	pandoc --lua-filter $(REMOVE_FOOTNOTES) -s -o $@ $<

%.html: %.md $(INLINE_FOOTNOTES)
	pandoc -s -o $@ $< -H $(INLINE_FOOTNOTES)


clean:
	rm -f $(HTML_DST) $(PDF_DST)
