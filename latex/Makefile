NAME = NameOfPdf

compile: $(THREADOBJECTS)
	gvim main.tex
	latexmk -pdf -bibtex -jobname=out/$(NAME) -view=pdf -pvc main.tex
clean:
	latexmk -CA
	rm ./out/*
