//
//  RankingFeatureCollectionViewCell.swift
//  AppStoreClone
//
//  Created by HYEONG SIK NAM on 2022/05/26.
//

import UIKit
import SnapKit

final class RankingFeatureCollectionViewCell: UICollectionViewCell {
    static var height: CGFloat { 70.0 }
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemGroupedBackground
        imageView.layer.cornerRadius = 7
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        
        return imageView
    }()
    
    lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .secondaryLabel

        return label
    }()
    
    lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    lazy var inAppPurchaseInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "앱내 구입"
        label.font = .systemFont(ofSize: 10.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [imageView, appNameLabel, descriptionLabel, downloadButton, inAppPurchaseInfoLabel].forEach {
            addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4)
            $0.leading.equalToSuperview()
            $0.width.equalTo(imageView.snp.height)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.trailing.equalTo(downloadButton.snp.leading)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(appNameLabel.snp.leading)
            $0.trailing.equalTo(appNameLabel.snp.trailing)
            $0.top.equalTo(appNameLabel.snp.bottom).offset(4)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(50)
            $0.height.equalTo(24)
        }
        
        inAppPurchaseInfoLabel.snp.makeConstraints {
            $0.centerX.equalTo(downloadButton.snp.centerX)
            $0.top.equalTo(downloadButton.snp.bottom).offset(4)
        }
    }
}
