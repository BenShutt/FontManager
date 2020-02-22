#  FontManager

## Framework

Easily manage a consistent global font in an iOS app, mapping `UIFont.TextStyle`s  to custom `UIFont`s.

### Example

```
// Define a global (custom) font
Font.fontManager = FontManager(fontName: "OpenSans")

// Use the font for different text styles throughout the app  
label.font = Font.font(for: .body)
```

### Installation

For this to work a `{fontName}.plist` file is required to be added to the `main` `Bundle`.
This maps `UIFont.TextStyle`s to `PreferredFont`s and thus a `UIFont`.
To automatically generate this `plist` file see [App](#App)

## App

A companion command line program for the `FontManager` framework.
Generates propertyList (`plist`) files for `FontManager` to reference.

The `plist` files which are generated include:
* `font-info.plist` which maps a single `UIAppFonts` key to an array of fonts. Allowing you to quickly add fonts to an app `Info.plist`
* `{fontName}.plist` mapping `UIFont.TextStyle`s to their `PreferredFont`s, to drive the `FontManager`

### How to run

From the command line: navigate to the font directory you would like to create `plist` files for, and simply execute:
```
bash -l -c "$(curl -sfL https://raw.githubusercontent.com/BenCShutt/FontManager/master/FontManagerApp/fontManagerApp.sh)"
```
The `plist` files will be written to the directory where the script is executed.

## Acknowledgements

[Use Your Loaf tutorial](https://useyourloaf.com/blog/using-a-custom-font-with-dynamic-type/)
