
#Makefile
# Create data

all: report/_build/html/index.html

results/isles.dat : scripts/wordcount.py data/isles.txt
	python scripts/wordcount.py --input_file=data/isles.txt \
		--output_file=results/isles.dat

results/abyss.dat : scripts/wordcount.py data/abyss.txt
	python scripts/wordcount.py --input_file=data/abyss.txt \
		--output_file=results/abyss.dat

results/last.dat : scripts/wordcount.py data/last.txt
	python scripts/wordcount.py --input_file=data/last.txt \
		--output_file=results/last.dat

results/sierra.dat : scripts/wordcount.py data/sierra.txt
	python scripts/wordcount.py --input_file=data/sierra.txt \
		--output_file=results/sierra.dat

results/figure/isles.png : scripts/plotcount.py results/isles.dat
	python scripts/plotcount.py --input_file=results/isles.dat \
		--output_file=results/figure/isles.png

results/figure/abyss.png : scripts/plotcount.py results/abyss.dat
	python scripts/plotcount.py --input_file=results/abyss.dat \
		--output_file=results/figure/abyss.png

results/figure/last.png : scripts/plotcount.py results/last.dat
	python scripts/plotcount.py --input_file=results/last.dat \
		--output_file=results/figure/last.png

results/figure/sierra.png : scripts/plotcount.py results/sierra.dat
	python scripts/plotcount.py --input_file=results/sierra.dat \
		--output_file=results/figure/sierra.png

report/_build/html/index.html : report/count_report.ipynb \
report/_toc.yml \
report/_config.yml \
results/figure/isles.png \
results/figure/abyss.png \
results/figure/last.png \
results/figure/sierra.png 
	jupyter-book build report

clean:
	rm -f results/isles.dat
	rm -f results/abyss.dat
	rm -f results/last.dat
	rm -f results/sierra.dat
	rm -f results/figure/isles.png
	rm -f results/figure/abyss.png
	rm -f results/figure/last.png
	rm -f results/figure/sierra.png
	rm -rf _build