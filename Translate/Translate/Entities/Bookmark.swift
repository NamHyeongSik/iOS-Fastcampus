//
//  Bookmark.swift
//  Translate
//
//  Created by HYEONG SIK NAM on 2022/08/10.
//

import Foundation

struct Bookmark: Codable {
    let sourceLanguage: Language
    let translatedLanguage: Language
    
    let sourceText: String
    let translatedText: String
}
