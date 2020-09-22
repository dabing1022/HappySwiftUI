//
//  CodeEditor.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/13.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct CodeSharedEditor: UIViewRepresentable {
    @EnvironmentObject var codeThemes: CodeThemeData
    var sourceCode: String?
    var fontName: String = CodeThemeData.defaultFontName
    var fontSize: Int = CodeThemeData.defaultFontSize
    
    func makeUIView(context: Context) -> CodeEditorView {
        return CodeEditorView.shared
    }

    func updateUIView(_ uiView: CodeEditorView, context: Context) {
        if (uiView.sourceCode != sourceCode) {
            uiView.sourceCode = sourceCode
        }
        if (uiView.codeTheme != codeThemes.currentTheme) {
            uiView.codeTheme = codeThemes.currentTheme
        }
        if (uiView.fontName != codeThemes.currentFontName) {
            uiView.fontName = codeThemes.currentFontName
        }
        if (uiView.fontSize != codeThemes.currentFontSize) {
            uiView.fontSize = codeThemes.currentFontSize
        }
    }
}


struct CodeEditor: UIViewRepresentable {
    @EnvironmentObject var codeThemes: CodeThemeData
    var sourceCode: String?
    var fontName: String = CodeThemeData.defaultFontName
    var fontSize: Int = CodeThemeData.defaultFontSize

    func makeUIView(context: Context) -> CodeEditorView {
        return CodeEditorView(frame: .zero, sourceCode: sourceCode)
    }

    func updateUIView(_ uiView: CodeEditorView, context: Context) {
        if (uiView.sourceCode != sourceCode) {
            uiView.sourceCode = sourceCode
        }
        if (uiView.codeTheme != codeThemes.currentTheme) {
            uiView.codeTheme = codeThemes.currentTheme
        }
        if (uiView.fontName != codeThemes.currentFontName) {
            uiView.fontName = codeThemes.currentFontName
        }
        if (uiView.fontSize != codeThemes.currentFontSize) {
            uiView.fontSize = codeThemes.currentFontSize
        }
    }
}
