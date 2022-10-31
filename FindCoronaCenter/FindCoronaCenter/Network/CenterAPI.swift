//
//  CenterAPI.swift
//  FindCoronaCenter
//
//  Created by HYEONG SIK NAM on 2022/08/08.
//

import Foundation

struct CenterAPI {
    static let schemes = "https"
    static let host = "api.odcloud.kr"
    static let path = "/api/15077586/v1/centers"
    
    func getCenterListComponents() -> URLComponents {
        var components = URLComponents()
        
        components.scheme = CenterAPI.schemes
        components.host = CenterAPI.host
        components.path = CenterAPI.path
        
        components.queryItems = [
            URLQueryItem(name: "perPage", value: "300")
        ]
        
        return components
    }
}
