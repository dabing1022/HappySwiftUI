//
//  CodeTheme.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/21.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Highlightr

class FontList {
    static let black: [String] = ["Zapfino"]
    static let classic: [String] = ["Fira Code",
                                    "Source Code Pro" ]
}

final class CodeThemeData: ObservableObject {
    let objectWillChange = PassthroughSubject<CodeThemeData, Never>()
    public static let codeThemeKey = "code_theme_key"
    public static let codeFontNameKey = "code_font_name_key"
    public static let codeFontSizeKey = "code_font_size_key"
    public static let defaultTheme = "Pojoaque"
    // keep the same with highlighr default config
    // setCodeFont(RPFont(name: "Courier", size: 14)!)
    public static let defaultFontName = "Courier"
    public static let defaultFontSize: Int = 14
    public static let themeSettings = [Localizable.theme, Localizable.font, Localizable.fontSize]
    public static let minCodeFontSize: Int = 11
    public static let maxCodeFontSize: Int = 26
    
    var availableThemes = Highlightr().availableThemes()
    var availableFontNames = [defaultFontName]
    var availableFontSizes = [Int](minCodeFontSize...maxCodeFontSize)
    
    var currentTheme = CodeThemeData.userTheme() {
        didSet {
            objectWillChange.send(self)
            
            UserDefaults.standard.setValue(currentTheme, forKey: CodeThemeData.codeThemeKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    var currentFontName = CodeThemeData.userFontName() {
        didSet {
            objectWillChange.send(self)
            
            UserDefaults.standard.setValue(currentFontName, forKey: CodeThemeData.codeFontNameKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    var currentFontSize = CodeThemeData.userFontSize() {
        didSet {
            objectWillChange.send(self)
            
            UserDefaults.standard.setValue(currentFontSize, forKey: CodeThemeData.codeFontSizeKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func userTheme() -> String {
        UserDefaults.standard.string(forKey: CodeThemeData.codeThemeKey) ?? CodeThemeData.defaultTheme
    }
    
    static func userFontName() -> String {
        UserDefaults.standard.string(forKey: CodeThemeData.codeFontNameKey) ?? CodeThemeData.defaultFontName
    }
    
    static func userFontSize() -> Int {
        var fontSize = UserDefaults.standard.integer(forKey: CodeThemeData.codeFontSizeKey)
        if fontSize == 0 {
            fontSize = CodeThemeData.defaultFontSize
        }
        return fontSize
    }
    
    func initCodeTheme() {
        var shouldSync = false
        if (UserDefaults.standard.string(forKey: CodeThemeData.codeThemeKey) == nil) {
            UserDefaults.standard.setValue(currentTheme, forKey: CodeThemeData.codeThemeKey)
            shouldSync = true
        }
        
        if (UserDefaults.standard.string(forKey: CodeThemeData.codeFontNameKey) == nil) {
            UserDefaults.standard.setValue(currentFontName, forKey: CodeThemeData.codeFontNameKey)
            shouldSync = true
        }

        if (UserDefaults.standard.integer(forKey: CodeThemeData.codeFontSizeKey) == 0) {
            UserDefaults.standard.setValue(currentFontSize, forKey: CodeThemeData.codeFontSizeKey)
            shouldSync = true
        }
        if shouldSync {
            UserDefaults.standard.synchronize()
        }
    }
}
