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

final class CodeThemeData: ObservableObject {
    let objectWillChange = PassthroughSubject<CodeThemeData, Never>()
    public static let codeThemeKey = "code_theme_key"
    public static let defaultTheme = "Pojoaque"
    
    var availableThemes = Highlightr().availableThemes()
    
    var currentTheme = CodeThemeData.userTheme() {
        didSet {
            objectWillChange.send(self)
            
            UserDefaults.standard.setValue(currentTheme, forKey: CodeThemeData.codeThemeKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func userTheme() -> String {
        UserDefaults.standard.string(forKey: CodeThemeData.codeThemeKey) ?? CodeThemeData.defaultTheme
    }
    
    func initCodeTheme() {
        if (UserDefaults.standard.string(forKey: CodeThemeData.codeThemeKey) == nil) {
            UserDefaults.standard.setValue(currentTheme, forKey: CodeThemeData.codeThemeKey)
            UserDefaults.standard.synchronize()
        }
    }
}
