//
//  MockFeedViewController.swift
//  twitter_cloneTests
//
//  Created by HYEONG SIK NAM on 2022/09/27.
//

import Foundation
@testable import twitter_clone

final class MockFeedViewController: FeedProtocol {
    var isCalledSetupViews = false
    var isCalledReloadTableView = false
    var isCalledMoveToTweetViewController = false
    var isCalledMoveToWriteViewController = false
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
    
    func moveToTweetViewController(with tweet: twitter_clone.Tweet) {
        isCalledMoveToTweetViewController = true
    }
    
    func moveToWriteViewController() {
        isCalledMoveToWriteViewController = true
    }
}
