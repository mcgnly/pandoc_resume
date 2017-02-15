all: html pdf docx rtf

pdf: cv.pdf
cv.pdf: cv.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o cv.tex cv.md; \
	context cv.tex

html: cv.html
cv.html: style_chmduquesne.css cv.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o cv.html cv.md

docx: cv.docx
cv.docx: cv.md
	pandoc -s -S cv.md -o cv.docx

rtf: cv.rtf
cv.rtf: cv.md
	pandoc -s -S cv.md -o cv.rtf

clean:
	rm cv.html
	rm cv.tex
	rm cv.tuc
	rm cv.log
	rm cv.pdf
	rm cv.docx
	rm cv.rtf
