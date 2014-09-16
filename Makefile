PERCENT := %

dimensions := "1666.7x1333.3"

all: out/slides.pdf

out/slides.pdf: out/pngs
	convert -page $(dimensions) $</slide_*.png $@

out/pngs: out/slides.png
	mkdir -p $@
	convert -crop $(dimensions) $< $@/slide_$(PERCENT)03d.png

out/slides.png: src/slides.svg
	mkdir -p $(dir $@)
	~/Applications/Inkscape.app/Contents/Resources/bin/inkscape \
		--file=$< \
		--export-dpi=100 \
		--export-png=$@ \
		--export-area-page

clean:
	rm -rf out/*
