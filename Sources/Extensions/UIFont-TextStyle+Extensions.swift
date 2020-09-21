//
//  UIFont-TextStyle+Extensions.swift
//  FontManager
//
//  Created by Ben Shutt on 22/02/2020.
//

#if os(iOS)
import UIKit

@available(iOS 10, *)
public extension UIFont.TextStyle {
    
    /// Default font size pre accessibility scaling for a given `textStyle`
    ///
    /// - Parameter textStyle: The `UIFont.TextStyle`
    static func defaultSize(_ textStyle: UIFont.TextStyle) -> CGFloat {
        let traitCollection = UITraitCollection(preferredContentSizeCategory: .large)
        return UIFontDescriptor.preferredFontDescriptor(
            withTextStyle: textStyle,
            compatibleWith: traitCollection
        ).pointSize
    }
    
    /// Default size for `UIFont.TextStyle`
    var defaultSize: CGFloat {
        return UIFont.TextStyle.defaultSize(self)
    }
}

// MARK: - CustomStringConvertible

extension UIFont.TextStyle: CustomStringConvertible {
    
    public var description: String {
        let lower = rawValue.lowercased()
        let replaced = lower.replacingOccurrences(of: "uictfonttextstyle", with: "")
        return replaced.capitalized
    }
}

// MARK: - CaseIterable

extension UIFont.TextStyle: CaseIterable {
    public typealias AllCases = [UIFont.TextStyle]
    
    public static var allCases: [UIFont.TextStyle] {
        var textStyles = [UIFont.TextStyle]()
        
        if #available(iOS 11, *) {
            textStyles += [
                .largeTitle,
                .title1,
                .title2,
                .title3
            ]
        }
        
        textStyles += [
            .headline,
            .subheadline,
            .body
        ]
        
        if #available(iOS 9, *) {
            textStyles += [
                .callout,
            ]
        }
        
        textStyles += [
            .footnote,
            .caption1,
            .caption2
        ]
        
        return textStyles
    }
}

#endif
