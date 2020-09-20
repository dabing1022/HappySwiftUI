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
            VStack {
                AppInfoView()
                SettingList()
            }
            .navigationBarTitle(Text(Localizable.setting, bundle: languages.bundle), displayMode: .large)
        }
    }
}

struct AppInfoView: View {
    var body: some View {
        HStack {
            Image("AppLogo")
                .clipShape(Circle())
                .padding()
            VStack {
                Text("Version 1.0.0")
            }
            Button("升级历史") {
                
            }
            .padding()
            .background(Color.red)
            .cornerRadius(4)
            Spacer()
        }
    }
}

struct SettingList: View {
    @EnvironmentObject var languages: LanguagesData
    
    var body: some View {
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
        .listStyle(InsetGroupedListStyle())
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
