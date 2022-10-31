//
//  BookSearchRequestModel.swift
//  BookReview
//
//  Created by HYEONG SIK NAM on 2022/08/17.
//

import Foundation

struct BookSearchRequestModel: Codable {
    /// 검색할 책 카워드
    let query: String
}
