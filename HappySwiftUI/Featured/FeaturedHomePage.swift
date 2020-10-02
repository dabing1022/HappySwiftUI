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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarTitle(Text(Localizable.featured, bundle: languages.bundle), displayMode: .large)

        
    }
}

struct FeaturedHomePage_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedHomePage()
    }
}
