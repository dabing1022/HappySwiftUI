//
//  LinkPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/22.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct LinkPage: View {
    var body: some View {
        Link("Jump to app author github homepage.",
              destination: URL(string: "https://www.github.com/dabing1022")!)
        .navigationBarTitle(Text(verbatim: "LinkPage"), displayMode: .inline)
    }
    
}

struct LinkPage_Previews: PreviewProvider {
    static var previews: some View {
        LinkPage()
    }
}


