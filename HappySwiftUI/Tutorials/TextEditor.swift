//
//  TextEditor.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/18.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct TextEditorPage: View {
    @State private var fullText: String = "This is some editable text..."
    
    var body: some View {
        TextEditor(text: $fullText)
            .foregroundColor(Color.gray)
            .font(.custom("HelveticaNeue", size: 13))
            .lineSpacing(5)
    }
}


struct TextEditorPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextEditorPage()
                .previewDevice("iPhone 11 Pro Max")
        }
    }
}
