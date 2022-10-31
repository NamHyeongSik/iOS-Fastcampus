//
//  User.swift
//  Cafe
//
//  Created by HYEONG SIK NAM on 2022/08/10.
//

import Foundation

struct User {
    let userName: String
    let account: String
    
    static let shared = User(userName: "hynam", account: "hynam@42seoul")
}
