//
//  Localizable.swift
//  HappySwiftUI
//
//  Created by ChildhoodAndy on 2020/9/6.
//  Copyright © 2020 HappyCoding. All rights reserved.
//

import SwiftUI
import Combine

struct Localizable {
    static let tutorials: LocalizedStringKey = "Tutorials"
    static let awesome: LocalizedStringKey = "Awesome"
    static let explore: LocalizedStringKey = "Explore"
    static let history: LocalizedStringKey = "History"
    static let favor: LocalizedStringKey = "Favor"
    static let featured: LocalizedStringKey = "Featured"
    static let setting: LocalizedStringKey = "Settings"
    static let versionHistory: LocalizedStringKey = "VersionHistory"
    static let languages: LocalizedStringKey = "Languages"
    static let appLanguage: LocalizedStringKey = "AppLanguage"
    static let automatic: LocalizedStringKey = "Automatic"
    static let wwdc: LocalizedStringKey = "WWDC"
    static let apple: LocalizedStringKey = "Apple"
    static let demo: LocalizedStringKey = "Demo"
    static let code: LocalizedStringKey = "Code"
    static let codeTheme: LocalizedStringKey = "Code Theme"
    static let codeFont: LocalizedStringKey = "Code Font"
    static let codeFontSize: LocalizedStringKey = "Code FontSize"
    static let theme: LocalizedStringKey = "Theme"
    static let font: LocalizedStringKey = "Font"
    static let fontSize: LocalizedStringKey = "FontSize"
    static let version: LocalizedStringKey = "Version"
    static let slogan: LocalizedStringKey = "Let's play SwiftUI happily!"
    static let issues: LocalizedStringKey = "Issues"

    enum SupportLanguages: String, CaseIterable, Identifiable {
        var id: String {
            return rawValue
        }

        case en
        case zh_Hans = "zh-Hans"

        func displayName() -> String {
            switch self {
            case .en:
                return "English"
            case .zh_Hans:
                return "简体中文"
            }
        }

        static func allDisplayNames() -> [String] {
            return allCases.map { (language) -> String in
                language.displayName()
            }
        }
    }

    static func identifierDisplayName() -> String {
        let identifier = self.identifier()
        for language in SupportLanguages.allCases {
            if language.rawValue == identifier {
                return language.displayName()
            }
        }
        return SupportLanguages.en.displayName()
    }

    static func identifier() -> String {
        guard let language = userLanguage() else {
            return SupportLanguages.en.rawValue
        }
        if language == SupportLanguages.en.rawValue {
            return language
        }
        if language.hasPrefix("zh-") {
            return SupportLanguages.zh_Hans.rawValue
        }
        return SupportLanguages.en.rawValue
    }

    static func userLanguage() -> String? {
        var language = NSLocale.preferredLanguages.first
        if language == nil {
            if let languages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String] {
                language = languages.first
            }
        }
        return language
    }

    static func setUserLanguage(_ language: SupportLanguages) {
        setUserLanguage(language.rawValue)
    }

    static func setUserLanguage(_ language: String) {
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}

final class LanguagesData: ObservableObject {
    let objectWillChange = PassthroughSubject<LanguagesData, Never>()
    
    @Published var languages: [Localizable.SupportLanguages] = Localizable.SupportLanguages.allCases
    var identifier = Localizable.identifier() {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var bundle: Bundle? {
        guard let bundle = Bundle.main.path(forResource: identifier, ofType: "lproj") else {
            return nil
        }
        return Bundle(path: bundle)
    }
}
