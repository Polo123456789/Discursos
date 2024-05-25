MARKDOWN_SRC := $(shell find . -name "*.md")
HTML_DST := $(MARKDOWN_SRC:.md=.html)
PDF_DST := $(MARKDOWN_SRC:.md=.pdf)



all: $(HTML_DST) $(PDF_DST)

%.html: %.md partials/inline-footnotes.html
	pandoc -s -o $@ $< -H partials/inline-footnotes.html

%.pdf: %.md
	pandoc -s -o $@ $<

clean:
	rm -f $(HTML_DST)

clean-pdf:
	rm -f $(PDF_DST)
