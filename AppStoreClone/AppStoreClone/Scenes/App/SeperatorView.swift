//
//  SeperatorView.swift
//  AppStoreClone
//
//  Created by HYEONG SIK NAM on 2022/05/26.
//

import UIKit
import SnapKit

final class SeperatorView: UIView {
    private lazy var seperator: UIView = {
        let seperator = UIView()
        seperator.backgroundColor = .separator
        
        return seperator
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(seperator)
        seperator.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.trailing.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
}
