//
//  ColorPickerPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/3.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI
import StoreKit

struct ColorPickerPage: View {
    @State private var bgColor =
        Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var fgColor = Color.white
    
    @State private var showRecommended = false
    
    var body: some View {
        VStack {
            Button("Show Recommended App") {
                self.showRecommended.toggle()
            }
            .appStoreOverlay(isPresented: $showRecommended) {
                SKOverlay.AppConfiguration(appIdentifier: "1002355194", position: .bottom)
            }
            Spacer()
            ColorPicker("Choose background color", selection: $bgColor)
                .padding(.horizontal, 30)
            Text("Happy SwiftUI!")
                .font(.system(.largeTitle))
                .foregroundColor(fgColor)
            ColorPicker("Choose forground color", selection: $fgColor)
                .padding(.horizontal, 30)
            Spacer()
        }
        .background(bgColor, alignment: .center)
        .navigationBarTitle(Text(verbatim: "ColorPicker"), displayMode: .inline)
    }
}

struct ColorPickerPage_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerPage()
    }
}
