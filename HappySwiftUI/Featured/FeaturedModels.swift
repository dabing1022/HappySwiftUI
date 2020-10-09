//
//  FeaturedModels.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/9.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import Foundation

struct Featured: Codable {
    var groups: [FeaturedGroup]
    
    struct FeaturedGroup: Codable, Identifiable {
        var id: Int {
            featuredId
        }
        let featuredId: Int
        let topic: String
        let source: String
        let type: String
        let items: [FeaturedItem]
    }
    
    struct FeaturedItem: Codable, Identifiable {
        var id: String {
            title
        }
        var title: String
        var url: String?
    }
    
    static func fromJson(_ json: String) -> Featured? {
        guard let jsonData = json.data(using: .utf8) else {
            return nil
        }
        let featured = try? JSONDecoder().decode(Featured.self, from: jsonData)
        return featured
    }
    
    static func from(resource: String, of type: String) -> Featured? {
        guard let path = Bundle.main.path(forResource: resource, ofType: type) else {
            return nil
        }
        guard let content = try? String(contentsOfFile: path) else {
            return nil
        }
        return fromJson(content)
    }
}
