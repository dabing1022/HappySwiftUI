//
//  LinkPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/22.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct LinkPage: View {
    @State private var showSafari = false
    
    let destinationUrl = URL(string: "https://www.github.com/dabing1022")!
    var body: some View {
        VStack {
            Link("Link: Jump to app author github homepage.",
                 destination: destinationUrl)
                .padding()

            Button("Button: Jump to app author github homepage.") {
                self.showSafari.toggle()
            }
            .padding()
            .fullScreenCover(isPresented: $showSafari) {
                SafariView(url: destinationUrl)
            }
        }
        .navigationBarTitle(Text(verbatim: "LinkPage"), displayMode: .inline)
    }
    
}

struct LinkPage_Previews: PreviewProvider {
    static var previews: some View {
        LinkPage()
    }
}


