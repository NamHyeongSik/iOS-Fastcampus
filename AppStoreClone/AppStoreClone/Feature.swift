//
//  Feature.swift
//  AppStoreClone
//
//  Created by HYEONG SIK NAM on 2022/05/27.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
