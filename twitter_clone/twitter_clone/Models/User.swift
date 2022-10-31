//
//  User.swift
//  twitter_clone
//
//  Created by HYEONG SIK NAM on 2022/09/20.
//

import Foundation

struct User: Codable {
    var name: String
    var account: String
    
    static var shared = User(name: "hynam", account: "ios_dev")
}
