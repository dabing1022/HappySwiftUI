//
//  LazyVStackPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/20.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct LazyVStackPage: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("Row \($0)")
                }
            }
        }
        .navigationBarTitle(Text(verbatim: "LazyVStack"), displayMode: .inline)
    }
    
}

struct LazyVStackPage_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackPage()
    }
}
