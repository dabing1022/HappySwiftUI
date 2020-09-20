//
//  LazyHGridPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/20.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct LazyHGridPage: View {
    let colors: [Color] = [.red, .green, .yellow, .blue]
    
    var rows1: [GridItem] =
        Array(repeating: .init(.flexible(), alignment: .center), count: 3)
    let rows2: [GridItem] = Array(repeating: .init(.fixed(20)), count: 2)
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows1, spacing: 10) {
                    ForEach(0...100, id: \.self) { index in
                        Text("Tab \(index)")
                            .frame(width: 110, height: 50)
                            .background(colors[index % colors.count])
                            .cornerRadius(8)
                    }
                }
            }
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows2, alignment: .top) {
                    ForEach((0...79), id: \.self) {
                        let codepoint = $0 + 0x1f600
                        let codepointString = String(format: "%02X", codepoint)
                        Text("\(codepointString)")
                            .font(.footnote)
                        let emoji = String(Character(UnicodeScalar(codepoint)!))
                        Text("\(emoji)")
                            .font(.largeTitle)
                    }
                }
            }
        }
        .navigationBarTitle(Text(verbatim: "LazyHGrid"), displayMode: .inline)
    }
    
}

struct LazyHGridPage_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridPage()
    }
}

