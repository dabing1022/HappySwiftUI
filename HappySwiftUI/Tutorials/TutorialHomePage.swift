//
//  TutorialHomePage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/5.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

/**
 1. https://developer.apple.com/documentation/swiftui/views-and-controls
 */

struct TutorialHomePage: View {
    @EnvironmentObject var languages: LanguagesData
    
    var body: some View {
        NavigationView {
            if #available(iOS 14.0, *) {
                TutorialHomePageList()
                    .listStyle(InsetGroupedListStyle())
                    .navigationBarTitle(Text(Localizable.tutorials, bundle: languages.bundle), displayMode: .large)
                    .navigationBarItems(trailing: Button(action: {
                        print("tap")
                    }, label: {
                        Text("right").foregroundColor(.orange)
                    }))
            } else {
                TutorialHomePageList()
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    .navigationBarTitle(Text(Localizable.tutorials, bundle: languages.bundle), displayMode: .large)
                    .navigationBarItems(trailing: Button(action: {
                        print("tap")
                    }, label: {
                        Text("right").foregroundColor(.orange)
                    }))
            }
        }
    }
}

struct TutorialHomePageList: View {
    var body: some View {
        List {
            Section(header:
                        HStack {
                            Text(verbatim: "Text").font(.system(.headline))
                        }
            ) {
                NavigationLink(destination: TextPage()) {
                    VStack(alignment: .leading) {
                        Text("Text")
                            .font(.system(.body))
                        Spacer()
                        Text("A view that displays one or more lines of read-only text.")
                            .font(.system(.footnote))
                    }
                    .padding(.vertical, 4)
                }
                NavigationLink(destination: TextPage()) {
                    VStack(alignment: .leading) {
                        Text("TextField")
                            .font(.system(.body))
                        Spacer()
                        Text("A control that displays an editable text interface.")
                            .font(.system(.footnote))
                    }
                    .padding(.vertical, 4)
                }
                NavigationLink(destination: TextPage()) {
                    VStack(alignment: .leading) {
                        Text("SecureField")
                            .font(.system(.body))
                        Spacer()
                        Text("A control into which the user securely enters private text.")
                            .font(.system(.footnote))
                    }
                    .padding(.vertical, 4)
                }
                NavigationLink(destination: TextEditorPage()) {
                    VStack(alignment: .leading) {
                        Text("TextEditor")
                            .font(.system(.body))
                        Spacer()
                        Text("A view that can display and edit long-form text.")
                            .font(.system(.footnote))
                    }
                    .padding(.vertical, 4)
                }
            }
            Section(header:
                        HStack {
                            Text(verbatim: "Images").font(.system(.headline))
                        }) {
                Text("Image")
            }
            Section(header: Text(verbatim: "Buttons").font(.system(.headline))) {
                Text("Button")
                Text("NavigationLink")
                Text("MenuButton")
                Text("EditButton")
                Text("PasteButton")
                Text("SignInWithAppleButton")
                Text("Menu")
            }
            Section(header: Text(verbatim: "Value Selectors").font(.system(.headline))) {
                Text("Toggle")
                NavigationLink(destination: PickerPage()) {
                    Text("Picker")
                }
                Text("DataPicker")
                Text("Slider")
                Text("Stepper")
                Text("ColorPicker")
            }
            Section(header: Text(verbatim: "Value Indicators").font(.system(.headline))) {
                Text("ProgressView")
                Text("Gauge")
                Text("Label")
                Text("Link")
            }
            
            Section(header: Text(verbatim: "Fonts and Localization").font(.system(.headline))) {
                Text("Font")
                Text("ScaledMetric")
                Text("LocalizedStringKey")
            }
        }
    }
}

#if DEBUG
struct TutorialHomePage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TutorialHomePage()
                .colorScheme(.dark)
                .environmentObject(LanguagesData())
            
            TutorialHomePage()
                .colorScheme(.light)
                .environmentObject(LanguagesData())
        }
    }
}
#endif
