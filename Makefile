PERCENT := %

all: .images

.images: out/slides.png
	convert -crop 33.33333$(PERCENT)x6.66666$(PERCENT) $< out/slide_$(PERCENT)03d.png
	touch .images

out/slides.png: src/slides.svg
	mkdir -p $(dir $@)
	~/Applications/Inkscape.app/Contents/Resources/bin/inkscape \
		--file=$< \
		--export-dpi=300 \
		--export-png=$@ \
		--export-area-page

clean:
	rm -f *.png .images
