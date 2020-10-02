//
//  VersionHistoryPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/2.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct VersionHistoryPage: View {
    @EnvironmentObject var languages: LanguagesData
    
    var body: some View {
        NavigationView {
            SettingList()
            .navigationBarTitle(Text(Localizable.setting, bundle: languages.bundle), displayMode: .large)
        }
    }
}

struct VersionHistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        VersionHistoryPage()
    }
}
