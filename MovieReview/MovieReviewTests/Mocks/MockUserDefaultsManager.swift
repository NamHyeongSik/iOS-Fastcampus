//
//  MockUserDefaultsManager.swift
//  MovieReviewTests
//
//  Created by HYEONG SIK NAM on 2022/08/29.
//

import Foundation
@testable import MovieReview

final class MockUserDefaultsManager: UserDefaultsProtocol {
    var isCalledGetMovies = false
    var isCalledAddMovie = false
    var isCalledRemoveMovie = false

    func getMovies() -> [Movie] {
        isCalledGetMovies = true
        return []
    }

    func addMovie(_ newValue: Movie) {
        isCalledAddMovie = true
    }

    func removeMovie(_ value: Movie) {
        isCalledRemoveMovie = true
    }
}
