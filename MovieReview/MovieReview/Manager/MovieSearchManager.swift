//
//  MovieSearchManager.swift
//  MovieReview
//
//  Created by HYEONG SIK NAM on 2022/08/18.
//

import Foundation
import Alamofire

protocol MovieSearchManagerProtocol {
    func request(from keyword: String, completionHander: @escaping ([Movie]) -> Void)
}

struct MovieSearchManager: MovieSearchManagerProtocol {
    func request(from keyword: String, completionHander: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/movie.json") else { return }
        let parameters = MovieSearchRequestModel(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "4Nme5IlTFt1BNDtlrxqE",
            "X-Naver-Client-Secret": "URXIv20C2P"
        ]
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: MovieSearchResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHander(result.items)
                case .failure(let error):
                    print(error)
                }
            }
            .resume()
    }
}
