//
//  Alert.swift
//  Drink
//
//  Created by HYEONG SIK NAM on 2022/05/13.
//

import Foundation

struct Alert: Codable {
    var id: String = UUID().uuidString
    let date: Date
    var isOn: Bool
    
    var time: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        return formatter.string(from: date)
    }
    
    var merdiem: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        formatter.locale = Locale(identifier: "ko")
        return formatter.string(from: date)
    }
}
