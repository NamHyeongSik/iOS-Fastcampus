//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by HYEONG SIK NAM on 2022/08/17.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items = [Book]()
}


