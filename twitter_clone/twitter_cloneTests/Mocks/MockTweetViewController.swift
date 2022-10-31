//
//  MockTweetViewController.swift
//  twitter_cloneTests
//
//  Created by HYEONG SIK NAM on 2022/09/27.
//

import Foundation
@testable import twitter_clone

final class MockTweetViewController: TweetProtocol {
    var isCalledSetTweet = false
    var isCalledSetupViews = false
    
    func setTweet(tweet: twitter_clone.Tweet) {
        isCalledSetTweet = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
}
