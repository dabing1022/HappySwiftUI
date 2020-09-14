//
//  CodeEditorVIew.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/13.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import Foundation
import Highlightr
import UIKit

class CodeEditorView: UIView {
    var sourceCode: String? {
        willSet {
            textView.isHidden = true
        }
        didSet {
            textView.text = sourceCode
        }
    }

    var codeTheme: String = "Pojoaque" {
        didSet {
            currentTheme = codeTheme
            highlightr.setTheme(to: codeTheme)
        }
    }

    private var textView: UITextView!
    private var highlightr: Highlightr!
    private let textStorage = CodeAttributedString()
    private var currentLanguage: String!
    private var currentTheme: String = "Pojoaque"

    convenience init(frame: CGRect = .zero, sourceCode: String?) {
        self.init(frame: frame)

        currentLanguage = "Swift"
        currentTheme = "Pojoaque"

        textStorage.highlightDelegate = self
        textStorage.language = currentLanguage.lowercased()
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)

        let textContainer = NSTextContainer(size: bounds.size)
        layoutManager.addTextContainer(textContainer)

        textView = UITextView(frame: bounds, textContainer: textContainer)
        textView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        textView.autocorrectionType = UITextAutocorrectionType.no
        textView.autocapitalizationType = UITextAutocapitalizationType.none
        textView.textColor = UIColor(white: 0.8, alpha: 1.0)
        textView.inputAccessoryView = nil
        textView.alwaysBounceVertical = true
        textView.keyboardDismissMode = .onDrag
        addSubview(textView)

        textView.text = sourceCode
        highlightr = textStorage.highlightr

        highlightr.setTheme(to: currentTheme)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        textView.frame = bounds
        textView.layoutManager.textContainers.forEach { container in
            container.size = bounds.size
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateColors() {
        textView.backgroundColor = highlightr.theme.themeBackgroundColor
    }
}

extension CodeEditorView: HighlightDelegate {
    func didHighlight(_ range: NSRange, success: Bool) {
        textView.isHidden = !success
    }
}
