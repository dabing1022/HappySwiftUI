//
//  TapicEngine.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/10/2.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import Foundation
import UIKit

protocol TapicEngineFeedback {
    var generator: UIFeedbackGenerator? { set get }
}

class TapicEngineImpact: TapicEngineFeedback {
    var generator: UIFeedbackGenerator?
    
    public func feedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        self.generator = UIImpactFeedbackGenerator(style: style)
        self.generator!.prepare()
        let sender = self.generator! as! UIImpactFeedbackGenerator
        sender.impactOccurred()
    }
}
 
class TapicEngineSelection: TapicEngineFeedback {
    var generator: UIFeedbackGenerator?
    
    init() {
        self.generator = UISelectionFeedbackGenerator()
    }
    
    public func feedback() {
        self.generator!.prepare()
        let sender = self.generator! as! UISelectionFeedbackGenerator
        sender.selectionChanged()
    }
}

class TapicEngineNotification: TapicEngineFeedback {
    var generator: UIFeedbackGenerator?
    
    init() {
        self.generator = UINotificationFeedbackGenerator()
    }
    
    public func feedback(type: UINotificationFeedbackGenerator.FeedbackType) {
        self.generator!.prepare()
        let sender = self.generator! as! UINotificationFeedbackGenerator
        sender.notificationOccurred(type)
    }
}

class TapicEngine {
    static let shared = TapicEngine()
    
    public lazy var impact = TapicEngineImpact()
    public lazy var selection = TapicEngineSelection()
    public lazy var notification = TapicEngineNotification()
}
