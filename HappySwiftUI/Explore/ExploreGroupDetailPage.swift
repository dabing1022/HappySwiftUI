//
//  ExploreGroupDetailPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/1.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct ExploreGroupDetailPage: View {
    @EnvironmentObject var languages: LanguagesData
    
    var group: Explore.ExploreGroup
    @State private var tapSelectedItem: Explore.ExploreItem?
    @State private var longPressSelectedItem: Explore.ExploreItem?
    
    var body: some View {
        List {
            Section {
                ForEach(group.items) { item in
                    VStack(alignment: .leading, spacing: 0) {
                        Text("\(item.title)")
                            .font(.system(.headline))
                        Text("\(item.url)")
                            .font(.system(.subheadline))
                            .lineLimit(nil)
                    }
                    .padding(.vertical, 2)
                    .onTapGesture {
                        self.tapSelectedItem = item
                    }
                    .onLongPressGesture {
                        TapicEngine.shared.impact.feedback(style: .light)
                        self.longPressSelectedItem = item
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .actionSheet(item: $longPressSelectedItem) { item in
            ActionSheet(title: Text(Localizable.chooseOpenWay, bundle: languages.bundle), buttons: [
                .default(Text(Localizable.embeddedSafari, bundle: languages.bundle)) {
                    self.tapSelectedItem = item
                },
                .default(Text(Localizable.universalLinks, bundle: languages.bundle)) {
                    UIApplication.shared.open(URL(string: item.url)!, options: [:], completionHandler: nil)
                },
                .cancel()
            ])
        }
        .sheet(item: $tapSelectedItem) { item in
            SafariView(url: URL(string: item.url)!)
        }
        .navigationBarTitle(Text(verbatim: group.source), displayMode: .inline)
    }
}

struct ExploreGroupDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        ExploreGroupDetailPage(group: Explore.ExploreGroup(groupId: 1,
                                                           source: "apple",
                                                           items: [Explore.ExploreItem(title: "test", url: "https://developer.apple.com")]))
    }
}
