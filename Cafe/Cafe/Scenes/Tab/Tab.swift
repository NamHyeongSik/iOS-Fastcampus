//
//  Tab.swift
//  Cafe
//
//  Created by HYEONG SIK NAM on 2022/08/09.
//

import SwiftUI

enum Tab {
    case home
    case other
    
    var tabTextItem: Text {
        switch self {
        case .home:
            return Text("Home")
        case .other:
            return Text("Other")
        }
    }
    
    var imageItem: Image {
        switch self {
        case .home:
            return Image(systemName: "house.fill")
        case .other:
            return Image(systemName: "ellipsis")
        }
    }
}
