//
//  MockUserDefaultsManager.swift
//  BookReviewTests
//
//  Created by HYEONG SIK NAM on 2022/08/17.
//

import Foundation
@testable import BookReview

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var isCalledGetReviews = false
    var isCalledSetReviews = false
    func getReviews() -> [BookReview] {
        isCalledGetReviews = true
        return []
    }
    
    func setReview(_ newValue: BookReview) {
        isCalledSetReviews = true
    }
}
