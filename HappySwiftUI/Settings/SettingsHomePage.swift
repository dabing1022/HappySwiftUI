//
//  SettingsHomePage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/5.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct SettingsHomePage: View {
    @EnvironmentObject var languages: LanguagesData
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: LanguagesView().environmentObject(self.languages)) {
                        HStack {
                            Text(Localizable.appLanguage, bundle: languages.bundle)
                            Spacer()
                            Text(Localizable.identifierDisplayName())
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle(Text(Localizable.setting, bundle: languages.bundle), displayMode: .large)
        }
    }
}

#if DEBUG

    struct SettingsHomePage_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                SettingsHomePage()
                SettingsHomePage().environment(\.locale, .init(identifier: Localizable.SupportLanguages.zh_Hans.rawValue))
            }
        }
    }

#endif
