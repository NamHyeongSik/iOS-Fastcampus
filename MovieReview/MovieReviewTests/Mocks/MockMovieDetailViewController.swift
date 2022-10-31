//
//  MockMovieDetailViewController.swift
//  MovieReviewTests
//
//  Created by HYEONG SIK NAM on 2022/08/29.
//

import Foundation
@testable import MovieReview

final class MockMovieDetailViewController: MovieDetailProtocol {
    var isCalledSetViews = false
    var isCalledSetRightBarButton = false

    var isSetIsLiked = false

    func setViews(with movie: Movie) {
        isCalledSetViews = true
    }

    func setRightBarButton(with isLiked: Bool) {
        isCalledSetRightBarButton = true
        isSetIsLiked = isLiked
    }
}
