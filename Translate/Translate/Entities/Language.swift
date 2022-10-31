//
//  Language.swift
//  Translate
//
//  Created by HYEONG SIK NAM on 2022/08/10.
//

import Foundation

enum Language: String, CaseIterable, Codable {
    case ko
    case en
    case ja
    case es
    
    var title: String {
        switch self {
        case .ko:
            return NSLocalizedString("Korean", comment: "한국어")
        case .en:
            return NSLocalizedString("English", comment: "영어")
        case .ja:
            return NSLocalizedString("Japanese", comment: "일본어")
        case .es:
            return NSLocalizedString("Spanish", comment: "스페인어")
        }
    }
    
    var languageCode: String {
        self.rawValue
    }
}
