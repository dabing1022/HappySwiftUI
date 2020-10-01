//
//  ExploreModels.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/1.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import Foundation

struct Explore: Codable {
    var groups: [ExploreGroup]
    
    struct ExploreGroup: Codable, Identifiable {
        var id: Int {
            groupId
        }
        var groupId: Int
        var source: String
        var items: [ExploreItem]
    }
    
    struct ExploreItem: Codable, Identifiable {
        var id: String {
            title
        }
        var title: String
        var url: String
    }
    
    static func fromJson(_ json: String) -> Explore? {
        guard let jsonData = json.data(using: .utf8) else {
            return nil
        }
        let explore = try? JSONDecoder().decode(Explore.self, from: jsonData)
        return explore
    }
    
    static func from(resource: String, of type: String) -> Explore? {
        guard let path = Bundle.main.path(forResource: resource, ofType: type) else {
            return nil
        }
        guard let content = try? String(contentsOfFile: path) else {
            return nil
        }
        return fromJson(content)
    }
}

