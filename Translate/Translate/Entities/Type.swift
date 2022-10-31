//
//  Type.swift
//  Translate
//
//  Created by HYEONG SIK NAM on 2022/08/16.
//

import UIKit

enum LangugeType {
    case source
    case target
    
    var color: UIColor {
        switch self {
        case .source:
            return .label
        case .target:
            return UIColor.mainTintColor
        }
    }
}
