//
//  LanguagesView.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/6.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import Combine
import SwiftUI

struct LanguagesView: View {
    @EnvironmentObject var languages: LanguagesData

    var body: some View {
        List(languages.languages) { language in
            LanguageItemCell(name: language.displayName(), selected: self.languages.identifier == language.rawValue)
                .contentShape(Rectangle())
                .onTapGesture {
                    print(language)
                    Localizable.setUserLanguage(language)
                    self.languages.identifier = language.rawValue
                }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle(Text(verbatim: Localizable.identifierDisplayName()), displayMode: .inline)
        .environment(\.horizontalSizeClass, .regular)
    }
}

struct LanguageItemCell: View {
    var name: String
    var selected: Bool
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            if selected {
                Image(systemName: "checkmark.circle.fill")
            }
        }
    }
}

#if DEBUG

    struct LanguagesView_Previews: PreviewProvider {
        static var previews: some View {
            LanguagesView()
                .colorScheme(.dark)
                .environmentObject(LanguagesData())
        }
    }

#endif
