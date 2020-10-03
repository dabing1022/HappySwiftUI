//
//  ProgressViewPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/3.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct ProgressViewPage: View {
    @State private var progress = 0.2
    
    var body: some View {
        VStack {
            ProgressView("Happy Loading...")
                .padding(.bottom, 20)
                .border(Color.green.opacity(0.2), width: 1.0)
            VStack {
                ProgressView(value: progress, total: 2.0)
                    .padding(.all, 20)
                HStack {
                    Text("0.00")
                    Spacer()
                    Text(String(format: "%.2f", progress))
                    Spacer()
                    Text("2.00")
                }
                .padding(.horizontal, 20)
                Button("Load More", action: {
                    progress += 0.05
                    if progress >= 2.0 {
                        progress = 2.0
                    }
                })
                .padding()
            }
            .border(Color.green.opacity(0.2), width: 1.0)
        }
        .navigationBarTitle(Text(verbatim: "ProgressView"), displayMode: .inline)
    }
}

struct ProgressViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewPage()
    }
}
