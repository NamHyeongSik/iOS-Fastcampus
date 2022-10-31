//
//  MockMovieListController.swift
//  MovieReviewTests
//
//  Created by HYEONG SIK NAM on 2022/08/29.
//

import Foundation
@testable import MovieReview

final class MockMovieListController: MovieListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupSearchBar = false
    var isCalledSetupViews = false
    var isCalledUpdateTableView = false
    var isCalledPushToMovieDetailViewController = false
    var isCalledUpdateCollectionView = false

    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }

    func setupSearchBar() {
        isCalledSetupSearchBar = true
    }

    func setupViews() {
        isCalledSetupViews = true
    }

    func updateTableView(isHidden: Bool) {
        isCalledUpdateTableView = true
    }

    func pushToMovieDetailViewController(with movie: Movie) {
        isCalledPushToMovieDetailViewController = true
    }

    func updateCollectionView() {
        isCalledUpdateCollectionView = true
    }
}
