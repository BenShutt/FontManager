//
//  UIFont+Weight+Extensions.swift
//  FontManager
//
//  Created by Ben Shutt on 22/02/2020.
//

#if os(iOS)
import UIKit

// MARK: - CaseIterable
extension UIFont.Weight: CaseIterable {
    public typealias AllCases = [UIFont.Weight]
    
    public static var allCases: [UIFont.Weight] {
        guard #available(iOS 8.2, *) else {
            return []
        }
        return [
            .ultraLight,
            .thin,
            .light,
            .regular,
            .medium,
            .semibold,
            .bold,
            .heavy,
            .black
        ]
    }
}

// MARK: - CustomStringConvertible

// Not a particularly nice interface to work with
extension UIFont.Weight: CustomStringConvertible {
    
    /// Map `UIFont.Weight` to a name
    private static var nameMap: [UIFont.Weight: String] {
        guard #available(iOS 8.2, *) else {
            return [:]
        }
        return [
            .ultraLight : "UltraLight",
            .thin : "Thin",
            .light : "Light",
            .regular : "Regular",
            .medium : "Medium",
            .semibold : "SemiBold",
            .bold : "Bold",
            .heavy : "Heavy",
            .black : "Black"
        ]
    }
    
    public var description: String {
        return UIFont.Weight.nameMap[self] ?? ""
    }
}

// MARK: - FontName

public extension UIFont.Weight {
    
    func fontName(_ fontName: String) -> String {
        return "\(fontName)-\(self)"
    }
}
#endif
