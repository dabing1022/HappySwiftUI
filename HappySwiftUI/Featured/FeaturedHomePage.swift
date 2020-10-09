//
//  FeaturedHomePage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/2.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

struct FeaturedHomePage: View {
    @EnvironmentObject var languages: LanguagesData
    
    @State private var featuredData: Featured? = Featured.from(resource: "featured", of: "json")
    @State private var selectedSafariUrl: String? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(featuredData?.groups ?? []) { card in
                        if card.type == "list" {
                            NavigationLink(destination: TextPage()) {
                                FeaturedTopicCard(card: card)
                                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 250, alignment: .center)
                            }.buttonStyle(PlainButtonStyle())
                        } else if card.type == "link" {
                            FeaturedTopicCard(card: card)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 250, alignment: .center)
                                .onTapGesture {
                                    self.selectedSafariUrl = card.items.first!.url!
                                }
                        }
                    }
                }
            }
            .sheet(item: self.$selectedSafariUrl) { url in
                SafariView(url: URL(string: url)!)
            }
            .navigationBarTitle(Text(Localizable.featured, bundle: languages.bundle), displayMode: .large)
        }
    }
}
