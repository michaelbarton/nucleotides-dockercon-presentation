PERCENT := %

all: .images

.images: out/slides.png
	convert -crop 100$(PERCENT)x2$(PERCENT) $< out/slide_$(PERCENT)03d.png
	touch .images

out/slides.png: src/slides.svg
	mkdir -p $(dir $@)
	~/Applications/Inkscape.app/Contents/Resources/bin/inkscape \
		--file=$< \
		--export-dpi=100 \
		--export-png=$@ \
		--export-area-page

clean:
	rm -f *.png .images
