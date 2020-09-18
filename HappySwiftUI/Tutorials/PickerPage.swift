//
//  PickerPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/18.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/picker
// struct DefaultPickerStyle
// struct SegmentedPickerStyle
// struct WheelPickerStyle
// struct PopUpButtonPickerStyle (unavailable in iOS)
// struct RadioGroupPickerStyle (unavailable in iOS)


enum Topping: String, CaseIterable, Identifiable {
    case nuts
    case cookies
    case blueberries
    
    var id: String { self.rawValue }
}

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry
    
    var id: String { self.rawValue }
}

extension Flavor {
    var suggestedTopping: Topping {
        switch self {
        case .chocolate: return .nuts
        case .vanilla: return .cookies
        case .strawberry: return .blueberries
        }
    }
}

struct PickerPage: View {
    @State private var selectedFlavor = Flavor.chocolate
    @State private var selectedTopping = Topping.nuts
    
    @State var favoriteColor = 0
    var colors = ["Red", "Green", "Blue"]
    var color_values: [Color] = [.red, .green, .blue]
    
    var body: some View {
        
        VStack {
            Picker("Favorite Color", selection: $favoriteColor) {
                ForEach(0 ..< colors.count) { index in
                    Text(self.colors[index])
//                        .foregroundColor(self.color_values[index])
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Text("Selected color: \(colors[favoriteColor])")
            
            Picker(selection: $selectedFlavor, label: Text("Flavor"), content: {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized).tag(flavor)
                }
            })
            .pickerStyle(WheelPickerStyle())
            
            Picker("Flavor", selection: $selectedFlavor) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized).tag(flavor)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("Topping", selection: $selectedTopping) {
                ForEach(Topping.allCases) { flavor in
                    Text(flavor.rawValue.capitalized).tag(flavor)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text("Selected flavor: \(selectedFlavor.rawValue)")
            Text("Selected toppping: \(selectedTopping.rawValue)")
        }
        .navigationBarTitle(Text(verbatim: "Picker"), displayMode: .inline)
    }
}


struct PickerPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PickerPage()
                .previewDevice("iPhone 11 Pro Max")
        }
    }
}
