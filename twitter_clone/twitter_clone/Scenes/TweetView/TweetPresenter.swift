//
//  TweetPresenter.swift
//  twitter_clone
//
//  Created by HYEONG SIK NAM on 2022/09/26.
//

import Foundation

protocol TweetProtocol: AnyObject {
    func setTweet(tweet: Tweet)
    func setupViews()
}

final class TweetPresenter {
    private weak var viewController: TweetProtocol?
    private let tweet: Tweet
    
    init(
        viewController: TweetProtocol? = nil,
        tweet: Tweet
    ) {
        self.viewController = viewController
        self.tweet = tweet
    }
    
    func viewDidload() {
        viewController?.setTweet(tweet: tweet)
        viewController?.setupViews()
    }
}
