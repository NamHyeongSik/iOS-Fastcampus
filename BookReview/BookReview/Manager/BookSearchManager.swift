//
//  BookSearchManager.swift
//  BookReview
//
//  Created by HYEONG SIK NAM on 2022/08/17.
//

import Alamofire
import Foundation

protocol BookSearchManagerProtocol {
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void))
}

struct BookSearchManager: BookSearchManagerProtocol {
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        let parameters = BookSearchRequestModel(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : "4Nme5IlTFt1BNDtlrxqE",
            "X-Naver-Client-Secret" : "URXIv20C2P"
        ]
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: BookSearchResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}

