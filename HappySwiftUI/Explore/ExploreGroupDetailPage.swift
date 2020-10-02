//
//  ExploreGroupDetailPage.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/1.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI

struct ExploreGroupDetailPage: View {
    var group: Explore.ExploreGroup
    @State private var showSafari = false
    
    @State private var showingActionSheet = false
    
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
                        self.showSafari.toggle()
                    }
                    .onLongPressGesture {
                        TapicEngine.shared.impact.feedback(style: .light)
                        self.showingActionSheet.toggle()
                    }
                    .sheet(isPresented: $showSafari) {
                        SafariView(url: URL(string: item.url)!)
                    }
                    .actionSheet(isPresented: $showingActionSheet) {
                        ActionSheet(title: Text("Star it"), buttons: [
                            .default(Text("Favor")) {
                            },
                            .cancel()
                        ])
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        
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
