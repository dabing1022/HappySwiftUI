//
//  CodeThemePickPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/21.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

/// 代码主题设置
/// 高亮主题
/// 字体
/// 字体大小
struct CodeThemePickPage: View {
    @EnvironmentObject var languages: LanguagesData
    @EnvironmentObject var codeThemes: CodeThemeData
    
    @State private var settingIndex = 0
    var body: some View {
        VStack {
            Text(codeThemes.currentTheme).font(.headline).padding(.top, 8)
            CodeEditor(sourceCode: CodeEditorHelper.sampleCode)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal)
            
            Picker(selection: $settingIndex, label: Text("Setting")) {
                ForEach(0 ..< CodeThemeData.themeSettings.count) {
                    Text(CodeThemeData.themeSettings[$0], bundle: languages.bundle).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            if settingIndex == 0 { // theme
                Picker(selection: $codeThemes.currentTheme, label: Text("CodeTheme"), content: {
                    ForEach(0 ..< codeThemes.availableThemes.count ) {
                        Text(codeThemes.availableThemes[$0]).tag(codeThemes.availableThemes[$0])
                    }
                })
                .pickerStyle(WheelPickerStyle())
            } else if settingIndex == 1 { // font
                Picker(selection: $codeThemes.currentFontName, label: Text("Font"), content: {
                    ForEach(0 ..< codeThemes.availableFontNames.count ) {
                        Text(codeThemes.availableFontNames[$0]).tag(codeThemes.availableFontNames[$0])
                    }
                })
                .pickerStyle(WheelPickerStyle())
            } else { // font size
                Picker(selection: $codeThemes.currentFontSize, label: Text("FontSize"), content: {
                    ForEach(0 ..< codeThemes.availableFontSizes.count ) {
                        Text("\(codeThemes.availableFontSizes[$0])").tag(codeThemes.availableFontSizes[$0])
                    }
                })
                .pickerStyle(WheelPickerStyle())
            }
        }
        .navigationBarTitle(Text(Localizable.codeTheme, bundle: languages.bundle), displayMode: .inline)
    }
}
