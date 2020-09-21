//
//  CodeEditorHelper.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/21.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import Foundation

struct CodeEditorHelper {
    static let sampleCode = """
import Foundation

@objc class Person: Entity {
  var name: String!
  var age:  Int!

  init(name: String, age: Int) {
    /* /* ... */ */
  }

  // Return a descriptive string for this person
  func description(offset: Int = 0) -> String {
    return
  }
}
"""
}
