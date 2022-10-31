//
//  AlertActionConvertible.swift
//  SearchBlog
//
//  Created by HYEONG SIK NAM on 2022/07/18.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
