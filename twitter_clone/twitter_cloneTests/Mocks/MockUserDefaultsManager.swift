//
//  MockUserDefaultsManager.swift
//  twitter_cloneTests
//
//  Created by HYEONG SIK NAM on 2022/09/27.
//

import Foundation
@testable import twitter_clone

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var tweets = [Tweet]()
    var newTweet: Tweet!
    
    var isCalledGetTweet = false
    var isCalledSetTweet = false
    
    func getTweet() -> [twitter_clone.Tweet] {
        isCalledGetTweet = true
        return tweets
    }
    
    func setTweet(_ newValue: twitter_clone.Tweet) {
        isCalledSetTweet = true
        self.newTweet = newValue
    }
}
