//
//  ProfilePresenterTests.swift
//  twitter_cloneTests
//
//  Created by HYEONG SIK NAM on 2022/09/27.
//

import XCTest
@testable import twitter_clone

class ProfilPresenterTests: XCTestCase {
    var sut: ProfilePresenter!
    var viewController: MockProfileViewController!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockProfileViewController()
        sut = ProfilePresenter(viewController: viewController)
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad_is_called() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupViews)
        XCTAssertTrue(viewController.isCalledSetViews)
    }
    
    func test_didTapSaveButton_is_called_when_name_is_nil() {
        sut.didTapSaveButton(name: nil, account: "account")
        
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledSetViews)
    }
    
    func test_didTapSaveButton_is_called_when_account_is_nil() {
        sut.didTapSaveButton(name: "name", account: nil)
        
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledSetViews)
    }
    
    func test_didTapSaveButton_is_called_when_name_is_empty() {
        sut.didTapSaveButton(name: "", account: "account")
        
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledSetViews)
    }
    
    func test_didTapSaveButton_is_called_when_account_is_empty() {
        sut.didTapSaveButton(name: "name", account: "")
        
        XCTAssertTrue(viewController.isCalledShowToast)
        XCTAssertFalse(viewController.isCalledEndEditing)
        XCTAssertFalse(viewController.isCalledSetViews)
    }
    
    func test_didTapSaveButton_is_called_when_name_and_account_exist() {
        sut.didTapSaveButton(name: "name", account: "account")
        
        XCTAssertFalse(viewController.isCalledShowToast)
        XCTAssertTrue(viewController.isCalledEndEditing)
        XCTAssertTrue(viewController.isCalledSetViews)
    }
}
