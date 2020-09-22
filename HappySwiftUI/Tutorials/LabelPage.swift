//
//  LabelPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/22.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct RedBorderedLabelStyle : LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .border(Color.red)
    }
}

struct LabelPage: View {
    var body: some View {
        VStack {
            Label("Lightning", systemImage: "bolt.fill")
            Label("Lightning", systemImage: "bolt.fill")
                .labelStyle(TitleOnlyLabelStyle())
            Label("Lightning", systemImage: "bolt.fill")
                .labelStyle(IconOnlyLabelStyle())
            Label {
                Text("HappySwiftUI")
                    .font(.body)
                    .foregroundColor(.primary)
                Text("learn SwiftUI")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            } icon: {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 44, height: 44, alignment: .center)
                    .overlay(Text("Hello"))
            }
                .labelStyle(RedBorderedLabelStyle())
            VStack {
                Label("Rain", systemImage: "cloud.rain")
                Label("Snow", systemImage: "snow")
                Label("Sun", systemImage: "sun.max")
            }
            .labelStyle(IconOnlyLabelStyle())
        }
        .navigationBarTitle(Text(verbatim: "LinkPage"), displayMode: .inline)
    }
    
}

struct LabelPage_Previews: PreviewProvider {
    static var previews: some View {
        LabelPage()
    }
}

