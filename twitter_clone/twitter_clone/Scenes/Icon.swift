//
//  Icon.swift
//  twitter_clone
//
//  Created by HYEONG SIK NAM on 2022/09/20.
//

import UIKit

enum Icon {
    case like
    case message
    case share
    case write
    
    var image: UIImage? {
        let systemName: String
        
        switch self {
        case .like: systemName = "heart"
        case .message: systemName = "message"
        case .share: systemName = "square.and.arrow.up"
        case .write: systemName = "square.and.pencil"
        }
        
        return UIImage(systemName: systemName)
    }
}

