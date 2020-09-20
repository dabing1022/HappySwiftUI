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
            TutorialHomePageTextSection()
            TutorialHomePageImagesSection()
            TutorialHomePageButtonsSection()
            TutorialHomePageValueSelectorsSection()
            TutorialHomePageValueIndicatorsSection()
            TutorialHomePageFontsLocalizationSection()
            TutorialHomePageStacksSection()
            TutorialHomePageGridsSection()
        }
    }
}

struct TutorialHomePageTextSection: View {
    var body: some View {
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
    }
}

struct TutorialHomePageImagesSection: View {
    var body: some View {
        Section(header:
                    HStack {
                        Text(verbatim: "Images").font(.system(.headline))
                    }) {
            Text("Image")
        }
    }
}

struct TutorialHomePageButtonsSection: View {
    var body: some View {
        Section(header: Text(verbatim: "Buttons").font(.system(.headline))) {
            Text("Button")
            Text("NavigationLink")
            Text("MenuButton")
            Text("EditButton")
            Text("PasteButton")
            Text("SignInWithAppleButton")
            Text("Menu")
        }
    }
}

struct TutorialHomePageValueSelectorsSection: View {
    var body: some View {
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
    }
}

struct TutorialHomePageValueIndicatorsSection: View {
    var body: some View {
        Section(header: Text(verbatim: "Value Indicators").font(.system(.headline))) {
            Text("ProgressView")
            Text("Gauge")
            Text("Label")
            Text("Link")
        }
    }
}

struct TutorialHomePageFontsLocalizationSection: View {
    var body: some View {
        Section(header: Text(verbatim: "Fonts and Localization").font(.system(.headline))) {
            Text("Font")
            Text("ScaledMetric")
            Text("LocalizedStringKey")
        }
    }
}

struct TutorialHomePageStacksSection: View {
    var body: some View {
        Section(header: Text(verbatim: "Stacks").font(.system(.headline))) {
            NavigationLink(destination: TextPage()) {
                VStack(alignment: .leading) {
                    Text("HStack")
                        .font(.system(.body))
                    Spacer()
                    Text("A view that arranges its children in a horizontal line.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
            NavigationLink(destination: TextPage()) {
                VStack(alignment: .leading) {
                    Text("VStack")
                        .font(.system(.body))
                    Spacer()
                    Text("A view that arranges its children in a vertical line.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
            NavigationLink(destination: TextPage()) {
                VStack(alignment: .leading) {
                    Text("ZStack")
                        .font(.system(.body))
                    Spacer()
                    Text("A view that overlays its children, aligning them in both axes.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
            NavigationLink(destination: LazyHStackPage()) {
                VStack(alignment: .leading) {
                    Text("LazyHStack")
                        .font(.system(.body))
                    Spacer()
                    Text("A view that arranges its children in a line that grows horizontally, creating items only as needed.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
            NavigationLink(destination: LazyVStackPage()) {
                VStack(alignment: .leading) {
                    Text("LazyVStack")
                        .font(.system(.body))
                    Spacer()
                    Text("A view that arranges its children in a line that grows vertically, creating items only as needed.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
        }
    }
}

struct TutorialHomePageGridsSection: View {
    var body: some View {
        Section(header: Text(verbatim: "Grids").font(.system(.headline))) {
            NavigationLink(destination: LazyHGridPage()) {
                VStack(alignment: .leading) {
                    Text("LazyHGrid")
                        .font(.system(.body))
                    Spacer()
                    Text("A container view that arranges its child views in a grid that grows horizontally, creating items only as needed.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
            NavigationLink(destination: TextPage()) {
                VStack(alignment: .leading) {
                    Text("LazyVGrid")
                        .font(.system(.body))
                    Spacer()
                    Text("A container view that arranges its child views in a grid that grows vertically, creating items only as needed.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
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
