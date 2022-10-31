//
//  MovieDetailPresenterTests.swift
//  MovieReviewTests
//
//  Created by HYEONG SIK NAM on 2022/08/29.
//

import Foundation
import XCTest

@testable import MovieReview

class MovieDetailPresenterTests: XCTestCase {
    var sut: MovieDetailPresenter!

    var viewController: MockMovieDetailViewController!
    var movie: Movie!
    var userDefaultsManager: MockUserDefaultsManager!

    override func setUp() {
        super.setUp()

        viewController = MockMovieDetailViewController()
        movie = Movie(title: "", imageURL: "", pubDate: "", director: "", actor: "", userRating: "")
        userDefaultsManager = MockUserDefaultsManager()

        sut = MovieDetailPresenter(viewController: viewController, movie: movie, userDefaultsManager: userDefaultsManager)
    }

    override func tearDown() {
        sut = nil

        viewController = nil
        movie = nil
        userDefaultsManager = nil

        super.tearDown()
    }

    func test_viewDidLoad_is_called() {
        sut.viewDidLoad()

        XCTAssertTrue(viewController.isCalledSetViews)
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
    }

    func test_didTapRightBarButtonItem이_호출될때_isLiked가_true가되면() {
        movie.isLiked = false
        sut = MovieDetailPresenter(viewController: viewController, movie: movie, userDefaultsManager: userDefaultsManager)
        sut.didTapRightBarButtonItem()

        XCTAssertTrue(userDefaultsManager.isCalledAddMovie)
        XCTAssertFalse(userDefaultsManager.isCalledRemoveMovie)
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
    }

    func test_didTapRightBarButtonItem이_호출될때_isLiked가_false가되면() {
        movie.isLiked = true
        sut = MovieDetailPresenter(viewController: viewController, movie: movie, userDefaultsManager: userDefaultsManager)
        sut.didTapRightBarButtonItem()

        XCTAssertTrue(userDefaultsManager.isCalledRemoveMovie)
        XCTAssertFalse(userDefaultsManager.isCalledAddMovie)
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
    }
}
