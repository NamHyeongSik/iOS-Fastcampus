//
//  TabBarItem.swift
//  twitter_clone
//
//  Created by HYEONG SIK NAM on 2022/09/20.
//

import UIKit

enum TabBarItem: CaseIterable {
    case feed
    case profile
    
    var title: String {
        switch self {
        case .feed:
            return "Feed"
        case .profile:
            return "Profile"
        }
    }
    
    var icon: (default: UIImage?, selected: UIImage?) {
        switch self {
        case .feed:
            return (UIImage(systemName: "list.dash"), UIImage(systemName: "list.dash"))
        case .profile:
            return (UIImage(systemName: "person"), UIImage(systemName: "person.fill"))
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .feed:
            return UINavigationController(rootViewController: FeedViewController())
        case .profile:
            return UINavigationController(rootViewController: ProfileViewController())
        }
    }
}
