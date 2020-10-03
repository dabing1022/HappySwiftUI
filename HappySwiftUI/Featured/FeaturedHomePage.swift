//
//  FeaturedHomePage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/2.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct FeaturedHomePage: View {
    @EnvironmentObject var languages: LanguagesData
    
    let data = [Card.example1, Card.example2]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(data) { card in
                        NavigationLink(destination: TextPage()) {
                            FeaturedTopicCard(card: card)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 250, alignment: .center)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarTitle(Text(Localizable.featured, bundle: languages.bundle), displayMode: .large)
        }
    }
}

struct FeaturedHomePage_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedHomePage()
    }
}
