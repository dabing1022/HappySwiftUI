//
//  LazyHStackPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/20.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct LazyHStackPage: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("Column \($0)")
                }
            }
        }
        .navigationBarTitle(Text(verbatim: "LazyHStack"), displayMode: .inline)
    }
    
}

struct LazyHStackPage_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStackPage()
    }
}

