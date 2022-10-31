//
//  MockMovieSearchManager.swift
//  MovieReviewTests
//
//  Created by HYEONG SIK NAM on 2022/08/29.
//

import Foundation

@testable import MovieReview

final class MockMoviSearchManager: MovieSearchManagerProtocol {
    var isCalledRequest = false
    var needToSuccessRequest = false
    func request(from keyword: String, completionHander: @escaping ([Movie]) -> Void) {
        isCalledRequest = true

        if needToSuccessRequest {
            completionHander([])
        }
    }
}
