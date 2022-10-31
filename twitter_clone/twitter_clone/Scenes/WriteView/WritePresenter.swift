//
//  WritePresenter.swift
//  twitter_clone
//
//  Created by HYEONG SIK NAM on 2022/09/26.
//

import Foundation

protocol WriteProtocol: AnyObject {
    func setupViews()
    func dismiss()
}

final class WritePresenter {
    private weak var viewController: WriteProtocol?
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    init(
        viewController: WriteProtocol? = nil,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsMananger()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController?.setupViews()
    }
    
    func didTapLeftBarButtonItem() {
        viewController?.dismiss()
    }
    
    func didTapRightBarButtonItem(text: String) {
        let tweet = Tweet(user: User.shared, contents: text)
        userDefaultsManager.setTweet(tweet)
        
        viewController?.dismiss()
    }
}
