//
//  Font.swift
//  FontManager
//
//  Created by Ben Shutt on 09/12/2019.
//  Copyright © 2019 Ben Shutt. All rights reserved.
//

#if os(iOS)
import UIKit

/// Manage app fonts
@available(iOS 11, *) // force 11, some functionality could be included
public final class Font {
    
    /// The selected default `FontManager`
    public static var fontManager: FontManager?
    
    // MARK: - Helper
    
    /// Get a `UIFont` for the given `textStyle`.
    /// Use the `default` `FontManager`
    ///
    /// - Parameter textStyle: `UIFont.TextStyle` of the font
    public static func font(for textStyle: UIFont.TextStyle) -> UIFont {
        return fontManager?.font(forTextStyle: textStyle) ??
            UIFont.scaledFont(for: textStyle)
    }
    
    /// `UIFont` for a given `weight` and `size` based on `fontManager`
    /// Return a default if not found
    ///
    /// - Parameters:
    ///   - weight: `UIFont.Weight` of the `UIFont`
    ///   - size: `CGFloat` size of font
    public static func font(for weight: UIFont.Weight, size: CGFloat) -> UIFont {
        if let fontName = fontManager?.fontName,
            let font = UIFont.scaledFont(name: fontName, weight: weight, size: size) {
                return font
        }
        
        return UIFont.systemFont(ofSize: size, weight: weight).scaled()
    }
    
    /// `UIFont` for a given `size` based on `fontManager`, return a default if not found
    /// - Parameter size: `CGFloat` size of font
    public static func font(for size: CGFloat) -> UIFont {
        if let fontName = fontManager?.fontName,
            let font = UIFont.scaledFont(name: fontName, size: size) {
                return font
        }
        
        return UIFont.systemFont(ofSize: size).scaled()
    }
}
#endif
