//
//  ExploreHomePage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/1.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct ExploreHomePage: View {
    @EnvironmentObject var languages: LanguagesData
    
    @State private var explore: Explore? = Explore.from(resource: "explore", of: "json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(explore?.groups ?? []) { group in
                    Section() {
                        NavigationLink(destination: ExploreGroupDetailPage(group: group)) {
                            Text("\(group.source)")
                        }
                    }
                }
            }
            .padding(.top, 4)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle(Text(Localizable.explore, bundle: languages.bundle), displayMode: .large)
        }
    }
}

struct ExploreHomePage_Previews: PreviewProvider {
    static var previews: some View {
        ExploreHomePage()
    }
}
