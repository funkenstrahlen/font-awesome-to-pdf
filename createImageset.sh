#! /bin/bash

function convert2pdf() {
	cd "$DIR/$COLOR/resized"
	mkdir -p ../pdf
	for f in *.svg
	do
		echo "creating pdf from ${f}"
		cairosvg "$f" -o "../pdf/$DIR-${f%.svg}.pdf"
	done
	cd -
}

function resizeSVGs() {
	SIZE=$1
	cd "$DIR/$COLOR/svg"
	mkdir -p ../resized
	for f in *.svg
	do
		echo "resizing ${f}"
		sed -e "s/width=\"1792\"/width=\"$SIZE\"/" -e "s/height=\"1792\"/height=\"$SIZE\"/" "$f" > "../resized/$f"
	done
	cd -
}

function generateColorset() {
	SIZE=$3
	DIR=$1
	COLOR=$2

	font-awesome-svg-png --no-png --color "$COLOR" --dest "$DIR"
	resizeSVGs $SIZE
	convert2pdf

	# cleanup
	rm -rf "$DIR/$COLOR/svg"
	rm -rf "$DIR/$COLOR/resized"
}

sizes=(25 44)
for size in "${sizes[@]}"
do
	generateColorset "black-$size" "#000000" $size
	generateColorset "white-$size" "#FFFFFF" $size
	generateColorset "corn-$size" "#EEC100" $size
	generateColorset "brandeis-blue-$size" "#0370E9" $size
	generateColorset "steel-$size" "#686868" $size
	generateColorset "tangelo-$size" "#F94710" $size
done










