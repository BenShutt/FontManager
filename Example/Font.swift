//
//  Font.swift
//  Example
//
//  Created by Ben Shutt on 09/12/2019.
//  Copyright © 2019 Ben Shutt. All rights reserved.
//

import UIKit
import FontManager

/// Manage app fonts
final class Font {
    
    /// The selected default `FontManager`
    private static var `default` = openSans
    
    // MARK: - Helper
    
    /// Get a `UIFont` for the given `textStyle`.
    /// Use the `default` `FontManager`
    ///
    /// - Parameter textStyle: `UIFont.TextStyle`
    static func font(for textStyle: UIFont.TextStyle) -> UIFont {
        return `default`.font(forTextStyle: textStyle)
    }
    
    // MARK: - FontManagers
    
    /// OpenSans `FontManager`
    static let openSans = FontManager(fontName: "OpenSans")
}
