//
//  Tweet.swift
//  twitter_clone
//
//  Created by HYEONG SIK NAM on 2022/09/20.
//

import Foundation

struct Tweet: Codable {
    let user: User
    let contents: String
}
