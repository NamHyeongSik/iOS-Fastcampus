//
//  MovieSearchResponseModel.swift
//  MovieReview
//
//  Created by HYEONG SIK NAM on 2022/08/18.
//

import Foundation

struct MovieSearchResponseModel: Decodable {
    var items = [Movie]()
}
