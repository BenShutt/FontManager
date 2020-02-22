//
//  WriteConfig.swift
//  FontManager
//
//  Created by Ben Shutt on 22/02/2020.
//  Copyright © 2019 Ben Shutt. All rights reserved.
//

import Foundation

/// Configurable settings read that can be read into a configuration file
public struct FontConfiguration: Codable {
    
    /// Attempt to read the configuration file, fallback on the default
    static var shared: FontConfiguration =
        (try? PropertyList.read(from: FileManager.default.fontConfigurationURL)) ??
        FontConfiguration()
    
    /// Font file extensions to use
    let fontExtension = "ttf"
    
    /// Name of the `PropertyList` file containing list of fonts to add to `Info.plist`
    let infoFileName = "font-info"
    
    /// Name of the `PropertyList` file containing `PreferredFont` mapping.
    /// `nil` will use the name of the font by default
    let preferredFontFileName: String? = nil
    
    /// When looking for a font of a specific type and it's prefered type could not be found, use a default
    let useDefaultFont = false
}

// MARK: - Extensions

private extension FileManager {
    
    /// `URL` of the `FontConfiguration` file
    var fontConfigurationURL: URL {
        return URL(fileURLWithPath: currentDirectoryPath)
            .appendingPathComponent(Constants.configurationFileName)
    }
}
