//
//  MockWriteViewController.swift
//  twitter_cloneTests
//
//  Created by HYEONG SIK NAM on 2022/09/27.
//

import Foundation
@testable import twitter_clone

final class MockWriteViewController: WriteProtocol {
    var isCalledSetupViews = false
    var isCalledDismiss = false
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func dismiss() {
        isCalledDismiss = true
    }
}
