//
//  FontDirectory.swift
//  FontManager
//
//  Created by Ben Shutt on 21/02/2020.
//  Copyright © 2019 Ben Shutt. All rights reserved.
//

import Foundation

/// An `Error` in `FontDirectory`
enum FontDirectoryError: Error {
    
    /// Directory not provided as a command line argument
    case directoryNotProvided
    
    /// Directory provided either doesn't exist
    case directoryNotFound
    
    /// File at the provided path is not a directory
    case fileNotDirectory
    
    /// Directory provided doesn't contain any font files
    case noFontFiles
    
    /// When looking for a specific font by name but that font can not be found
    case fontNotFound
}

/// Intialize the app by acquiring and validating the font directory
struct FontDirectory {
    
    /// Font directory `URL` provided as command line argument
    let fontDirectory: URL
    
    /// `URL` of font files in `fontDirectory`
    let fontFiles: [URL]
    
    /// Initialize `FontConfiguration`.
    /// Will check the command line arguments for a given font directory path and
    /// ensures we can process it.
    init() throws {
        let fm = FileManager.default
        
        // Check for a command line argument
        guard CommandLine.arguments.count > 1 else {
            throw FontDirectoryError.directoryNotProvided
        }

        // Get a URL reference to the path provided as argument
        let directory = URL(fileURLWithPath: CommandLine.arguments[1])

        // Check the directory at the given path exists
        var isDirectory: ObjCBool = false
        guard fm.fileExists(atPath: directory.path, isDirectory: &isDirectory) else {
            throw FontDirectoryError.directoryNotFound
        }
        
        // And check it is a directory
        guard isDirectory.boolValue else {
            throw FontDirectoryError.fileNotDirectory
        }
        
        // Look for font files in the directory provided
        let contents = try fm.contentsOfDirectory(atPath: directory.path)
        let files = contents.filter {
            ($0 as NSString).pathExtension == FontConfiguration.shared.fontExtension
        }
        
        // Ensure there is at least 1 font
        guard files.count > 0 else {
            throw FontDirectoryError.noFontFiles
        }
        
        self.fontDirectory = directory
        self.fontFiles = files.map { directory.appendingPathComponent($0) }
    }
    
    /// Name of the font
    var fontName: String {
        return fontDirectory.lastPathComponent
    }
    
    /// Find the `URL` of the given `font`.
    /// - Parameter filename: Name of the font file
    func find(font: String) throws -> URL {
        var filename = font
        if !filename.hasSuffix(FontConfiguration.shared.fontExtension) {
            filename += FontConfiguration.shared.fontExtension
        }
        
        let url = fontDirectory.appendingPathComponent(filename)
        if let file = fontFiles.first(where: { $0 == url }) {
            return file
        }
        
        if FontConfiguration.shared.useDefaultFont {
            return fontFiles.first! // Empty checked on init
        }
        
        throw FontDirectoryError.fontNotFound
    }
}
