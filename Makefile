LATEXMK ?= latexmk

.PHONY: all clean

all:
	@if command -v $(LATEXMK) >/dev/null 2>&1; then \
		cd paper && $(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=build main.tex; \
	else \
		echo "$(LATEXMK) not found; using pdflatex/bibtex fallback"; \
		cd paper && mkdir -p build && pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex >/dev/null && \
		(if grep -q '\\citation' build/main.aux; then bibtex build/main >/dev/null; fi) && \
		pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex >/dev/null && \
		pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex >/dev/null; \
	fi

clean:
	cd paper && $(LATEXMK) -C -outdir=build main.tex || true
	rm -rf paper/build
