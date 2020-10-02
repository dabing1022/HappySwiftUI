//
//  Version.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/2.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import Foundation

struct Version {
    static let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
}
