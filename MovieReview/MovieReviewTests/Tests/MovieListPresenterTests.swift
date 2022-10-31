//
//  MovieListPresenterTests.swift
//  MovieReviewTests
//
//  Created by HYEONG SIK NAM on 2022/08/29.
//

import XCTest

@testable import MovieReview

class MovieListPresenterTests: XCTestCase {
    var sut: MovieListPresenter!
    var viewController: MockMovieListController!
    var userDefaultsManager: MockUserDefaultsManager!
    var movieSearchManager: MockMoviSearchManager!

    override func setUp() {
        super.setUp()
        viewController = MockMovieListController()
        userDefaultsManager = MockUserDefaultsManager()
        movieSearchManager = MockMoviSearchManager()

        sut = MovieListPresenter(viewController: viewController, movieSearchManager: movieSearchManager, userDefualtsManager: userDefaultsManager)
    }

    override func tearDown() {
        sut = nil

        viewController = nil
        userDefaultsManager = nil
        movieSearchManager = nil

        super.tearDown()
    }

    func test_searchBar_textDidChange가_호출될때_request가_성공하면() {
        movieSearchManager.needToSuccessRequest = true
        sut.searchBar(UISearchBar(), textDidChange: "")
        XCTAssertTrue(viewController.isCalledUpdateTableView, "updateTableView가 호출된다")
    }

    func test_searchBar_textDidChange가_호출될때_request가_실패하면() {
        movieSearchManager.needToSuccessRequest = false
        sut.searchBar(UISearchBar(), textDidChange: "")
        XCTAssertFalse(viewController.isCalledUpdateTableView, "updateTableView가 호출되지 않는다")
    }

    func test_viewDidLoad_is_called() {
        sut.viewDidLoad()

        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupSearchBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }

    func test_viewWillAppear_is_called() {
        sut.viewWillApper()

        XCTAssertTrue(userDefaultsManager.isCalledGetMovies)
        XCTAssertTrue(viewController.isCalledUpdateCollectionView)
    }

    func test_searchBarTextDidBeginEditing_is_called() {
        sut.searchBarTextDidBeginEditing(UISearchBar())

        XCTAssertTrue(viewController.isCalledUpdateTableView)
    }

    func test_searchBarCancelButtonClicked_is_called() {
        sut.searchBarCancelButtonClicked(UISearchBar())

        XCTAssertTrue(viewController.isCalledUpdateTableView)
    }
}
