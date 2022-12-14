//
//  RankingFeatureSectionView.swift
//  AppStoreClone
//
//  Created by HYEONG SIK NAM on 2022/05/26.
//

import UIKit
import SnapKit

final class RankingFeatureSectionView: UIView {
    private var rankingFeatureList = [RankingFeature]()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone이 처음이라면"
        label.font = .systemFont(ofSize: 18, weight: .black)
        
        return label
    }()
    
    private lazy var showAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 32.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(RankingFeatureCollectionViewCell.self, forCellWithReuseIdentifier: "RankingFeatureSectionCollectionView")
        
        return collectionView
    }()
    
    private let seperator = SeperatorView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [titleLabel, showAllButton, collectionView, seperator].forEach {
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16.0)
//            $0.trailing.equalTo(showAllButton.snp.leading).offset(8.0)
        }

        showAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16.0)
            $0.bottom.equalTo(titleLabel.snp.bottom)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            $0.height.equalTo(RankingFeatureCollectionViewCell.height * 3)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        seperator.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(16.0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        fetchData()
//        collectionView.reloadData()
    }
    
    private func fetchData() {
        guard let url = Bundle.main.url(forResource: "RankingFeature", withExtension: "plist") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([RankingFeature].self, from: data)
            rankingFeatureList = result
        } catch {
            
        }
    }
}

extension RankingFeatureSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rankingFeatureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankingFeatureSectionCollectionView", for: indexPath) as? RankingFeatureCollectionViewCell else { return UICollectionViewCell() }
        
        let rankingFeature = rankingFeatureList[indexPath.row]
        
        cell.appNameLabel.text = rankingFeature.title
        cell.descriptionLabel.text = rankingFeature.description
        cell.inAppPurchaseInfoLabel.isHidden = !rankingFeature.isInPurchaseApp
        
        return cell
    }
}

extension RankingFeatureSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: RankingFeatureCollectionViewCell.height)
    }
}
