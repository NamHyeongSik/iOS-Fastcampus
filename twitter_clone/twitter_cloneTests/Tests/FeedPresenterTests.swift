//
//  FeedPresenterTests.swift
//  twitter_cloneTests
//
//  Created by HYEONG SIK NAM on 2022/09/27.
//

import XCTest
@testable import twitter_clone

class FeedPresenterTests: XCTestCase {
    var sut: FeedPresenter!
    var viewController: MockFeedViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockFeedViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = FeedPresenter(viewController: viewController, userdefaultsManager: userDefaultsManager)
    }
    
    override func tearDown() {
        sut = nil
        
        userDefaultsManager = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad_is_called() {
        sut.viewDidLoad()
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_viewWillAppear_is_called() {
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isCalledGetTweet)
        XCTAssertTrue(viewController.isCalledReloadTableView)
    }
    
    func test_didTapWriteButton_is_called() {
        sut.didTapWriteButton()
        
        XCTAssertTrue(viewController.isCalledMoveToWriteViewController)
    }
}
