//
//  CodeEditor.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/13.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct CodeEditor: UIViewRepresentable {
    var sourceCode: String?
    
    func makeUIView(context: Context) -> CodeEditorView {
        return CodeEditorView(frame: .zero, sourceCode: sourceCode)
    }

    func updateUIView(_ uiView: CodeEditorView, context: Context) {
        uiView.sourceCode = sourceCode
    }
}
