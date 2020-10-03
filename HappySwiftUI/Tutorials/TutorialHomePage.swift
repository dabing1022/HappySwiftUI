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
            TutorialHomePageListsAndScrollViewsSection()
        }
    }
}

struct SectionHeader: View {
    var title: String
    var body: some View {
        Text(verbatim: title)
            .font(.system(.headline))
            .textCase(.none)
    }
}

struct TutorialHomePageListSectionLabelStyle : LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
//            .font(.system(.title))
            .foregroundColor(.red)
            .textCase(.none)
    }
}

struct TutorialHomePageTextSection: View {
    var body: some View {
        Section(header: SectionHeader(title: "Text")) {
            NavigationLink(destination: TextPage()) {
                VStack(alignment: .leading) {
                    Text(verbatim: "Text")
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
        Section(header: SectionHeader(title: "Images")) {
            Text("Image")
        }
    }
}

struct TutorialHomePageButtonsSection: View {
    var body: some View {
        Section(header: SectionHeader(title: "Buttons")) {
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
        Section(header: SectionHeader(title: "Value Selectors")) {
            Text("Toggle")
            NavigationLink(destination: PickerPage()) {
                Text("Picker")
            }
            Text("DataPicker")
            Text("Slider")
            Text("Stepper")
            NavigationLink(destination: ColorPickerPage()) {
                VStack(alignment: .leading) {
                    Text(verbatim: "ColorPicker")
                        .font(.system(.body))
                    Spacer()
                    Text("A control used to select a color from the system color picker UI.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
        }
    }
}

struct TutorialHomePageValueIndicatorsSection: View {
    @State private var showingAlert = false
    var body: some View {
        Section(header: SectionHeader(title: "Value Indicators")) {
            NavigationLink(destination: ProgressViewPage()) {
                VStack(alignment: .leading) {
                    Text(verbatim: "ProgressView")
                        .font(.system(.body))
                    Spacer()
                    Text("A view that shows the progress towards completion of a task.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
            HStack {
                Text(verbatim: "Gauge")
                    .foregroundColor(Color.gray)
                Spacer()
            }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.showingAlert = true
                }
                .alert(isPresented: $showingAlert) {
                    // TODO: 国际化
                    Alert(title: Text("Tip"), message: Text("GauGe Availability: watchOS"), dismissButton: .default(Text("OK"))
                          
                    )
                }
            NavigationLink(destination: LabelPage()) {
                Text(verbatim: "Label")
            }
            NavigationLink(destination: LinkPage()) {
                Text(verbatim: "Link")
            }
        }
    }
}

struct TutorialHomePageFontsLocalizationSection: View {
    var body: some View {
        Section(header: SectionHeader(title: "Fonts and Localization")) {
            Text(verbatim: "Font")
            Text(verbatim: "ScaledMetric")
            Text(verbatim: "LocalizedStringKey")
        }
    }
}

struct TutorialHomePageStacksSection: View {
    var body: some View {
        Section(header: SectionHeader(title: "Stacks")) {
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
        Section(header: SectionHeader(title: "Grids")) {
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

struct TutorialHomePageListsAndScrollViewsSection: View {
    var body: some View {
        Section(header: SectionHeader(title: "Lists and Scroll Views")) {
            NavigationLink(destination: LazyHGridPage()) {
                VStack(alignment: .leading) {
                    Text("List")
                        .font(.system(.body))
                    Spacer()
                    Text("A container that presents rows of data arranged in a single column.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
            NavigationLink(destination: TextPage()) {
                VStack(alignment: .leading) {
                    Text("ForEach")
                        .font(.system(.body))
                    Spacer()
                    Text("A structure that computes views on demand from an underlying collection of of identified data.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
            NavigationLink(destination: TextPage()) {
                VStack(alignment: .leading) {
                    Text("ScrollView")
                        .font(.system(.body))
                    Spacer()
                    Text("A scrollable view.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
            // https://www.youtube.com/watch?v=uitE6bmeFxM&t=104s&ab_channel=PaulHudson
            NavigationLink(destination: TextPage()) {
                VStack(alignment: .leading) {
                    Text("ScrollViewReader")
                        .font(.system(.body))
                    Spacer()
                    Text("A view whose child is defined as a function of a ScrollViewProxy targeting the scrollable views within the child.")
                        .font(.system(.footnote))
                }
                .padding(.vertical, 4)
            }
            NavigationLink(destination: TextPage()) {
                VStack(alignment: .leading) {
                    Text("ScrollViewProxy")
                        .font(.system(.body))
                    Spacer()
                    Text("A proxy value allowing the scrollable views within a view hierarchy to be scrolled programmatically.")
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
