# collect data
collect-tournaments:
	Rscript R/collect-tournament-data.R

collect-matches:
	Rscript R/collect-matches.R

predict-matches:
	Rscript R/predict-matches.R

tennis: collect-tournaments collect-matches predict-matches

# build website
HTML_FILES := $(patsubst %.Rmd, %.html ,$(wildcard *.Rmd)) \
              $(patsubst %.md, %.html ,$(wildcard *.md))

website: clean html

html: $(HTML_FILES)

%.html: %.Rmd
	R --vanilla --slave -e "rmarkdown::render('$<')"

%.html: %.md
	R --vanilla --slave -e "rmarkdown::render('$<')"

.PHONY: clean
clean:
	$(RM) $(HTML_FILES)
