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
            SettingList()
            .navigationBarTitle(Text(Localizable.setting, bundle: languages.bundle), displayMode: .large)
        }
    }
}

struct AppInfoView: View {
    @EnvironmentObject var languages: LanguagesData
    
    var body: some View {
        HStack {
            Image("AppLogo")
                .frame(width: 60, height: 60, alignment: Alignment.center)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
            VStack(alignment: .leading, spacing: 6) {
                Text(Localizable.slogan, bundle: languages.bundle)
                    .textCase(.none)
                Text(Localizable.version, bundle: languages.bundle) + Text(" \(Version.appVersion)")
            }
            Spacer()
        }
    }
}

struct SettingList: View {
    @EnvironmentObject var languages: LanguagesData
    @EnvironmentObject var codeThemes: CodeThemeData
    
    @State private var showSafari = false
    
    var body: some View {
        List {
            Section(header: AppInfoView()) {
                NavigationLink(destination: LanguagesView()) {
                    HStack {
                        Text(Localizable.appLanguage, bundle: languages.bundle)
                        Spacer()
                        Text(Localizable.identifierDisplayName())
                    }
                }
            }
            
            Section {
                NavigationLink(destination: CodeThemePickPage(settingName: Localizable.theme)) {
                    HStack {
                        Text(Localizable.codeTheme, bundle: languages.bundle)
                        Spacer()
                        Text(codeThemes.currentTheme)
                    }
                }
                NavigationLink(destination: CodeThemePickPage(settingName: Localizable.font)) {
                    HStack {
                        Text(Localizable.codeFont, bundle: languages.bundle)
                        Spacer()
                        Text(codeThemes.currentFontName)
                    }
                }
                NavigationLink(destination: CodeThemePickPage(settingName: Localizable.fontSize)) {
                    HStack {
                        Text(Localizable.codeFontSize, bundle: languages.bundle)
                        Spacer()
                        Text("\(codeThemes.currentFontSize)")
                    }
                }
            }
            
            Section {
                Text(Localizable.issues, bundle: languages.bundle)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.showSafari.toggle()
                    }
                .sheet(isPresented: $showSafari) {
                    SafariView(url: URL(string: GlobalData.github_issues_url)!)
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
