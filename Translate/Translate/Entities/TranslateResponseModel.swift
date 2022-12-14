//
//  TranslateResponseModel.swift
//  Translate
//
//  Created by HYEONG SIK NAM on 2022/08/16.
//

import Foundation

struct TranslateResponseModel: Decodable {
    private let message: Message
    
    var translatedText: String {
        message.result.translatedText
    }
    
    struct Message: Decodable {
        let result: Result
    }
    
    struct Result: Decodable {
        let translatedText: String
    }
}
