//
//  LazyVStackPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/20.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct SampleRow: View {
    let id: Int
    @Binding var console: String
    
    var body: some View {
        Text("Row \(id)")
            .onAppear {
                let log = "Load row \(id)"
                print(log)
                if (self.console.count > 0) {
                    self.console.append("\n")
                }
                self.console.append(log)
            }
    }
    
//    init(id: Int, console: Binding<String>) {
//        self.id = id
//        self._console = console
//    }
}

struct LazyVStackPage: View {
    @State private var console: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(1...100, id: \.self) {
                        SampleRow(id: $0, console: self.$console)
                    }
                }
            }
            
            ScrollView {
                ScrollViewReader { scrollView in
                    Text(self.console)
                        .border(Color.white, width: 1.5)
                        .lineLimit(nil)
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
