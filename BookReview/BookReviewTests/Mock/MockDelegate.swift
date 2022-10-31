//
//  MockDelegate.swift
//  BookReviewTests
//
//  Created by HYEONG SIK NAM on 2022/10/12.
//

import Foundation
@testable import BookReview

class MockDelegate: SearchBookDelegate {
    var isCalledSelecBook = false
    
    func selectBook(_ book: Book) {
        isCalledSelecBook = true
    }
}
