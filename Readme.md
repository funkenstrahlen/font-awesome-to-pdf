# Create PDF iconset from Fontawesome icons

This is a bash script to create a PDF iconset from [Fontawesome](http://fontawesome.io) icons. It can generate different sizes and colors. It is optimized to work with XCode 6 or higher, so you can use the generated icons in your XCode projects.

## Basic iconset

If you just need some basic colors and sizes like *black, white, blue, yellow, red* you might be happy using the iconsets provided in this repository.

If you want to generate your own sets though, take a look at **Install** and **Usage**.

## Install

This code is based on two other required tools:

* [Font-Awesome-SVG-PNG](https://github.com/encharm/Font-Awesome-SVG-PNG) to generate SVG files from the Fontawesome font
* [CairoSVG](http://cairosvg.org) to generate the PDF files from the SVGs

Install both (take a look at their installation steps).

Download the `createImageset.sh` script from this project.

## Usage

Currently you have to edit the `createImageset.sh` file and add your generation calls to the end of the file.

An example looks like this:

```bash
generateColorset "prefix" "#F94710" 25
```

The `prefix` will be added in front of all icon names. I personally set it to `black-25` to see the icon is black and has a size of 25x25.

You also have to define the `color` as CSS-Hex value. For example `#000000` is black.

At last you define the size of the PDF viewport. In this example 25 (25x25). This is important for XCode as it uses this as @1x base size of the imported image. Check out the [iOS Human Interface Guidelines](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/IconMatrix.html#//apple_ref/doc/uid/TP40006556-CH27-SW1) to read more about correct image sizes.

Now run the script. It will generate a subfolder with the PDF icon files for each call of `generateColorset`.

# Contribute

This script is not very nice code. It was created very fast just to do the job. If you would like to improve it feel free to create a pull request :)