//
//  TextPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/13.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct TextPage: View {
    @EnvironmentObject var languages: LanguagesData
    
    @State private var seg = 0
    var segs = [Localizable.demo, Localizable.code]
    
    var body: some View {
        VStack {
            Picker(selection: $seg, label: Text("")) {
                ForEach(0 ..< segs.count) { index in
                    Text(self.segs[index], bundle: self.languages.bundle)
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 20)
            
            if seg == 0 {
                TextPageDemo()
            } else if seg == 1 {
                TextPageCode()
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(verbatim: "Text"), displayMode: .inline)
    }
}

struct TextPageDemo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Hamlet")
                .font(.title)
            
            Text("by William Shakespeare")
                .font(.system(size: 12, weight: .light, design: .serif))
                .italic()
            
            Text("To be, or not to be, that is the question:")
                .frame(width: 100)
            
            Text("Brevity is the soul of wit.")
                .frame(width: 100)
                .lineLimit(1)
            
            Text("SwiftUI")
                .foregroundColor(.orange)
                .bold()
                .font(.system(.largeTitle))
                .fontWeight(.medium)
                .italic()
                .shadow(color: .black, radius: 1, x: 0, y: 2)
            
            Text("github")
                .underline(true, color: Color.gray)
                .font(.system(size: 16, design: .serif)).onTapGesture {
                    print("github")
                }
            
            Text("Views and controls are the visual building blocks of your app’s user interface." +
                    " Use them to present your app’s content onscreen.")
                .lineLimit(nil)
        }
    }
}

struct TextPageCode: View {
    var body: some View {
        let code = """
Text("github")
    .underline(true, color: Color.gray)
    .font(.system(size: 16, design: .serif)).onTapGesture {
        print("github")
    }

Text("Views and controls are the visual building blocks of your app’s user interface." +
    " Use them to present your app’s content onscreen.")
    .lineLimit(nil)
Text("github")
    .underline(true, color: Color.gray)
    .font(.system(size: 16, design: .serif)).onTapGesture {
        print("github")
    }

Text("Views and controls are the visual building blocks of your app’s user interface." +
    " Use them to present your app’s content onscreen.")
    .lineLimit(nil)
Text("github")
    .underline(true, color: Color.gray)
    .font(.system(size: 16, design: .serif)).onTapGesture {
        print("github")
    }
"""
        return CodeEditor(sourceCode: code)
    }
}

#if DEBUG
struct TextPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextPage()
        }
    }
}
#endif
