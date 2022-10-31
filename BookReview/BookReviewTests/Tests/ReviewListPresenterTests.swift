//
//  BookReviewTests.swift
//  ReviewListPresenterTests
//
//  Created by HYEONG SIK NAM on 2022/08/17.
//

import XCTest
@testable import BookReview

class ReviewListPresenterTests: XCTestCase {
    var sut: ReviewListPresenter!
    var viewController: MockReviewListViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        sut = ReviewListPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager
        )
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_is_called() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_didTapRigthBarButtonItem_is_called() {
        sut.didTapRigthBarButtonItem()
        
        XCTAssertTrue(viewController.isCalledPresentToReviewWriteViewController)
    }
    
    func test_viewWillAppear_is_called() {
        sut.viewWillAppear()
        XCTAssertTrue(viewController.isCalledReloadTableView)
        XCTAssertTrue(userDefaultsManager.isCalledGetReviews)
    }
    
}
