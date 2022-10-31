//
//  MockSearchBookViewController.swift
//  BookReviewTests
//
//  Created by HYEONG SIK NAM on 2022/10/17.
//

import Foundation
@testable import BookReview

final class MockSearchBookViewController: SearchBookPorotocol {
    var isCalledSetupViews = false
    var isCalledDismiss = false
    var isCalledReloadView = false
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func dismiss() {
        isCalledDismiss = true
    }
    
    func reloadView() {
        isCalledReloadView = true
    }
    
    
}
