//
//  ReviewWritePresenterTests.swift
//  BookReviewTests
//
//  Created by HYEONG SIK NAM on 2022/08/17.
//

import XCTest
@testable import BookReview

class ReviewWritePresenterTests: XCTestCase {
    var sut: ReviewWritePresenter!
    var viewController: MockReviewWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        viewController = MockReviewWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()
        sut = ReviewWritePresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager)
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        userDefaultsManager = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad_is_called() {
        sut.viewDidLoad()
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_didTapLeftBarButton_is_called() {
        sut.didTapLeftBarButton()
        XCTAssertTrue(viewController.isCalledShowCloseAlert)
    }
    
    func test_didTapRightBarButton_does_not_have_book_and_is_called() {
        sut.book = nil
        XCTAssertFalse(userDefaultsManager.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButton_has_book_but_does_not_have_contents_and_is_called() {
        sut.book = Book(title: "Swift", imageUrl: "")
        sut.didTapRightBarButton(contentsText: nil)
        XCTAssertFalse(userDefaultsManager.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButton_is_called() {
        sut.book = Book(title: "Swift", imageUrl: "")
        sut.didTapRightBarButton(contentsText: "text contents")
        XCTAssertTrue(userDefaultsManager.isCalledSetReviews)
        XCTAssertTrue(viewController.isCalledClose)
    }
    
    func test_didTapTitleButton_is_called() {
        sut.didTapTitleButton()
        XCTAssertTrue(viewController.isCalledPresentToSearchBookViewController)
    }
}
