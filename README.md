#  FontManager

## Framework

Map `UIFont.TextStyle`  to `PreferredFont`s

## App

As a companion app to the `FontManager` framework, generate PropertyList (`plist`) files for `FontManager` to reference.

The `plist` files generated include:
* `font-info.plist` which maps a single `UIAppFonts` key to an array of fonts. Allowing you to quickly add fonts to an app `Info.plist`
* `{fontName}.plist` mapping `UIFont.TextStyle`s to their `PreferredFont`, to drive `FontManager`

### To Run

Simply navigate to the font directory to create `plist` files for in your command line and run:
    bash -l -c "$(curl -sfL https://raw.githubusercontent.com/bitrise-tools/codesigndoc/master/_scripts/install_wrap.sh)"
