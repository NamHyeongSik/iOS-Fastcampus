//
//  MockBookSearchManager.swift
//  BookReviewTests
//
//  Created by HYEONG SIK NAM on 2022/10/17.
//

import Foundation
@testable import BookReview

final class MockBookSearchManager: BookSearchManagerProtocol {
    var isCalledRequest = false
    var isSuccessRequest = false
    
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        isCalledRequest = true
        
        if isSuccessRequest {
            completionHandler([])
        }
    }
}
