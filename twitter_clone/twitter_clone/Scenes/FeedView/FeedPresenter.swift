//
//  FeedPresenter.swift
//  twitter_clone
//
//  Created by HYEONG SIK NAM on 2022/09/20.
//

import UIKit

protocol FeedProtocol: AnyObject {
    func setupViews()
    func reloadTableView()
    func moveToTweetViewController(with tweet: Tweet)
    func moveToWriteViewController()
}

final class FeedPresenter: NSObject {
    private weak var viewController: FeedProtocol?
    private let userdefaultsManager: UserDefaultsManagerProtocol
    private var tweets = [Tweet]()
    
    init(
        viewController: FeedProtocol? = nil,
        userdefaultsManager: UserDefaultsManagerProtocol = UserDefaultsMananger()
    ) {
        self.viewController = viewController
        self.userdefaultsManager = userdefaultsManager
    }
    
    func viewDidLoad() {
        viewController?.setupViews()
    }
    
    func viewWillAppear() {
        tweets = userdefaultsManager.getTweet()
        viewController?.reloadTableView()
    }
    
    func didTapWriteButton() {
        viewController?.moveToWriteViewController()
    }
}


extension FeedPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        let tweet = tweets[indexPath.row]
        cell.setup(tweet: tweet)
        return cell
    }
}

extension FeedPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tweet = tweets[indexPath.row]
        viewController?.moveToTweetViewController(with: tweet)
    }
}
