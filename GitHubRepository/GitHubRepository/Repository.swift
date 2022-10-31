//
//  Repository.swift
//  GitHubRepository
//
//  Created by HYEONG SIK NAM on 2022/07/05.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let name: String
    let description: String
    let stargazersCount: Int
    let language: String
    
    enum Codingkeys: String, CodingKey {
        case id, name, description, language
        case stargazersCount = "stargazers_count"
    }
}
