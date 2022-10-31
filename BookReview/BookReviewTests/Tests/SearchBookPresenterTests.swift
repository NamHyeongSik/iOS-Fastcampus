//
//  SearchBookPresenterTests.swift
//  BookReviewTests
//
//  Created by HYEONG SIK NAM on 2022/10/17.
//

import XCTest
@testable import BookReview

class SearchBookPresenterTests: XCTestCase {
    var sut: SearchBookPresenter!
    var viewController: MockSearchBookViewController!
    var bookSearchManager: MockBookSearchManager!
    
    var delegate: MockDelegate!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockSearchBookViewController()
        bookSearchManager = MockBookSearchManager()
        delegate = MockDelegate()
        sut = SearchBookPresenter(viewController: viewController, bookSearchManager: bookSearchManager, delegate: delegate)
    }
    
    override func tearDown() {
        sut = nil
        
        delegate = nil
        bookSearchManager = nil
        viewController = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_is_called() {
        sut.viewDidLoad()
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_searchBarSearchButtonClicked가_호출될때_requset가_성공하면() {
        let searchBar = UISearchBar()
        searchBar.text = "겨울왕국"
        sut.searchBarSearchButtonClicked(searchBar)
        bookSearchManager.isSuccessRequest = true
        XCTAssertTrue(bookSearchManager.isSuccessRequest)
    }
    
    func test_searchBarSearchButtonClicked가_호출될때_requset가_실패하면() {
        let searchBar = UISearchBar()
        searchBar.text = "겨울왕국"
        sut.searchBarSearchButtonClicked(searchBar)
        XCTAssertFalse(bookSearchManager.isSuccessRequest)
    }
}
