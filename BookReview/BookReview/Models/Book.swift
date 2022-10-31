//
//  Book.swift
//  BookReview
//
//  Created by HYEONG SIK NAM on 2022/08/17.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "") }
    
    init(title: String, imageUrl: String?) {
        self.title = title
        self.image = imageUrl
    }
}
