//
//  StationDetailCollectionViewCell.swift
//  Subway
//
//  Created by HYEONG SIK NAM on 2022/05/30.
//

import UIKit
import SnapKit

final class StationDetailCollectionViewCell: UICollectionViewCell {
    
    private lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var remainTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        
        return label
    }()
    
    func setup(with realTimeArrival: StationArrivalResponseModel.RealTimeArrival) {
        self.layer.cornerRadius = 12.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 10.0
        backgroundColor = .systemBackground //기준값이 있어야 그림자가 생김
        
        [lineLabel, remainTimeLabel].forEach {
            addSubview($0)
        }
        
        lineLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(16)
        }
        
        remainTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(lineLabel)
            $0.top.equalTo(lineLabel.snp.bottom).offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        lineLabel.text = realTimeArrival.line
        remainTimeLabel.text = realTimeArrival.remainTime
    }
}
