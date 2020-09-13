//
//  CodeEditorVIew.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/13.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import Foundation
import UIKit
// import Highlightr

class CodeEditorView: UIView {
    var textView: UITextView!

//    var highlightr : Highlightr!
//    var textStorage : CodeAttributedString!

    var currentLanguage: String!
    var currentTheme: String!

    override init(frame: CGRect) {
        super.init(frame: frame)

        currentLanguage = "Swift"
        currentTheme = "Pojoaque"

//        let layoutManager = NSLayoutManager()
//        textStorage = CodeAttributedString()
//        textStorage.addLayoutManager(layoutManager)

//        let width = ZZFrame.screenWidth()
//        let width = 400
//        let height = CGFloat.greatestFiniteMagnitude

//        let textContainer = NSTextContainer(size: CGSize(width: width, height: height))
//        layoutManager.addTextContainer(textContainer)

//        textView = UITextView(frame: self.view.bounds, textContainer: textContainer)
//        textView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        textView.autocorrectionType = UITextAutocorrectionType.no
//        textView.autocapitalizationType = UITextAutocapitalizationType.none
//        textView.textColor = UIColor(white: 0.8, alpha: 1.0)
//        textView.inputAccessoryView = nil
//        textView.keyboardDismissMode = .onDrag
//        self.addSubview(textView)

//        highlightr = textStorage.highlightr
//
//        let font = RPFont(name: CMUSerDefaults.codeFont(), size: CGFloat(CMUSerDefaults.codeFontSize()))!
//        textStorage.language = currentLanguage.lowercased()
//        highlightr.setTheme(to: currentTheme)
//        highlightr.theme.setCodeFont(font)
//        textView.text = originText
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
