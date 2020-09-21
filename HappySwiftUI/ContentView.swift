//
//  ContentView.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/5.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var languages: LanguagesData

    var body: some View {
        TabView {
            TutorialHomePage()
                .tabItem {
                    Image(systemName: "book")
                    Text(Localizable.tutorials, bundle: languages.bundle)
                }
            Text("The content of the first view")
                .tabItem {
                    Image(systemName: "safari")
                    Text(Localizable.explore, bundle: languages.bundle)
                }
            Text("The content of the first view")
                .tabItem {
                    Image(systemName: "timer")
                    Text(Localizable.history, bundle: languages.bundle)
                }
            SettingsHomePage()
                .environmentObject(self.languages)
                .tabItem {
                    Image(systemName: "gear")
                    Text(Localizable.setting, bundle: languages.bundle)
                }
        }
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let languages = LanguagesData()
            languages.identifier = "zh"
            return Group {
                ContentView()
                    .colorScheme(.dark)
                    .environmentObject(languages)
                    .environment(\.locale, .init(identifier: languages.identifier))
            }
        }
    }

#endif
