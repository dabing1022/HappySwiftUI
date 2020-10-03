//
//  TextEditorPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/18.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct TextEditorPage: View {
    @State private var text1: String = "This is text editor1"
    @State private var text2: String = "This is text editor2"
    
    var body: some View {
        VStack {
            TextEditor(text: $text1)
                .foregroundColor(Color.yellow)
                .font(.custom("HelveticaNeue", size: 13))
                .lineSpacing(5)
                .border(Color.yellow, width: 2.0)
            TextEditor(text: $text2)
                .foregroundColor(Color.white)
                .font(.system(.footnote))
                .lineLimit(5)
                .border(Color.white, width: 2.0)
        }
        .navigationBarTitle(Text(verbatim: "TextEditor"), displayMode: .inline)
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
