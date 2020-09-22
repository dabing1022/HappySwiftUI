//
//  CodeThemePickPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/21.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct CodeThemePickPage: View {
    @EnvironmentObject var languages: LanguagesData
    @EnvironmentObject var codeThemes: CodeThemeData
    
    var body: some View {
        VStack {
            Text(codeThemes.currentTheme).font(.headline).padding(.top, 8)
            CodeEditor(sourceCode: CodeEditorHelper.sampleCode)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal)
            
            Picker(selection: $codeThemes.currentTheme, label: Text("CodeTheme"), content: {
                ForEach(0 ..< codeThemes.availableThemes.count ) {
                    Text(codeThemes.availableThemes[$0]).tag(codeThemes.availableThemes[$0])
                }
            })
            .pickerStyle(WheelPickerStyle())
        }
        .navigationBarTitle(Text(Localizable.codeTheme, bundle: languages.bundle), displayMode: .inline)
    }
}
