//
//  WritePresenterTests.swift
//  twitter_cloneTests
//
//  Created by HYEONG SIK NAM on 2022/09/27.
//

import XCTest
@testable import twitter_clone

class WritePresenterTests: XCTestCase {
    var sut: WritePresenter!
    var viewController: MockWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = WritePresenter(viewController: viewController, userDefaultsManager: userDefaultsManager)
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
    
    func test_didTapLeftBarButtonItem_is_called() {
        sut.didTapLeftBarButtonItem()
        
        XCTAssertTrue(viewController.isCalledDismiss)
    }
    
    func test_didTapRightBarButtonItem_is_called() {
        sut.didTapRightBarButtonItem(text: "text")
        
        XCTAssertTrue(userDefaultsManager.isCalledSetTweet)
        XCTAssertTrue(viewController.isCalledDismiss)
    }
}
