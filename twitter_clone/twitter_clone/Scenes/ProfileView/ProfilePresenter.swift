//
//  ProfilePresenter.swift
//  twitter_clone
//
//  Created by HYEONG SIK NAM on 2022/09/27.
//

import Foundation

protocol ProfileProtocol: AnyObject {
    func setupViews()
    func setViews(with name: String, account: String)
    func endEditing()
    func showToast()
}

final class ProfilePresenter {
    private weak var viewController: ProfileProtocol?
    private var user: User {
        get { User.shared }
        set { User.shared = newValue }
    }
    
    init(viewController: ProfileProtocol? = nil) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupViews()
        viewController?.setViews(with: user.name, account: user.account)
    }
    
    func didTapSaveButton(name: String?, account: String?) {
        if name == nil || account == nil || name == "" || account == "" {
            viewController?.showToast()
            return
        }
        viewController?.endEditing()
        
        if let name = name,
           let account = account {
            user.name = name
            user.account = account
        }
        
        viewController?.setViews(with: user.name, account: user.account)
    }
}
