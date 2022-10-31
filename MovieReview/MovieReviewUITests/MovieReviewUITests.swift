//
//  MovieReviewUITests.swift
//  MovieReviewUITests
//
//  Created by HYEONG SIK NAM on 2022/08/18.
//

import XCTest

class MovieReviewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func test_navigationBar의_title이_영화리뷰로_설정되어있다() {
        let existNavigationBar = app.navigationBars["영화 리뷰"].exists
        XCTAssertTrue(existNavigationBar)
    }

    func test_navigationBar의_searchBar가_존재한다() {
        let existSearchBar = app.navigationBars["영화 리뷰"].searchFields["Search"].exists
        XCTAssertTrue(existSearchBar)
    }

    func test_navigationBar의_searchBar의_cancel버튼이_존재한다() {
        let navigationBar = app.navigationBars["영화 리뷰"]
        navigationBar.searchFields["Search"].tap()

        let existCancelButton = navigationBar.buttons["Cancel"].exists
        XCTAssertTrue(existCancelButton)
    }

    override func tearDown() {
        super.tearDown()

        app = nil
    }

    // BDD
    enum CellData: String {
        case existMovie = "우주대전쟁"
        case nonExistMovie = "스타워즈"
    }

    func test_영화가_즐겨찾기_되어있으면() {
        let existCell = app.collectionViews
            .cells
            .containing(.staticText, identifier: CellData.existMovie.rawValue)
            .element
            .exists

        XCTAssertTrue(existCell, "Title이 표시된 cell이 존재한다.")
    }

    func test_영화가_즐겨찾기_되어있지_않으면() {
        let existCell = app.collectionViews
            .cells
            .containing(.staticText, identifier: CellData.nonExistMovie.rawValue)
            .element
            .exists

        XCTAssertFalse(existCell, "Title이 표시된 cell이 존재하지 않는다.")
    }
}
