//
//  TranslateRequestModel.swift
//  Translate
//
//  Created by HYEONG SIK NAM on 2022/08/16.
//

import Foundation

struct TranslateRequestModel: Codable {
    let source: String
    let target: String
    let text: String
}
