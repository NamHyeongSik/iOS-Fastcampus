//
//  TweetPresenterTests.swift
//  twitter_cloneTests
//
//  Created by HYEONG SIK NAM on 2022/09/27.
//

import XCTest
@testable import twitter_clone

class TweetPresenterTests: XCTestCase {
    var sut: TweetPresenter!
    var viewController: MockTweetViewController!
    var tweet: Tweet!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockTweetViewController()
        tweet = Tweet(user: User(name: "hynam", account: "hynam@ios.dev"), contents: "Hi nam!")
        sut = TweetPresenter(viewController: viewController, tweet: tweet)
    }
    
    override func tearDown() {
        sut = nil
        
        tweet = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad_is_called() {
        sut.viewDidload()
        
        XCTAssertTrue(viewController.isCalledSetTweet)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
}
