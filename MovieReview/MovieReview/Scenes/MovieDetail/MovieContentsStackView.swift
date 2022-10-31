//
//  MovieContentsStackView.swift
//  MovieReview
//
//  Created by HYEONG SIK NAM on 2022/08/18.
//

import UIKit
import SnapKit

final class MovieContentsStackView: UIStackView {
    private let title: String
    private let content: String

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        label.text = title

        return label
    }()

    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.text = content

        return label
    }()

    init(title: String, content: String) {
        self.title = title
        self.content = content
        super.init(frame: .zero)

        [titleLabel, contentLabel].forEach {
            addArrangedSubview($0)
        }

        titleLabel.snp.makeConstraints {
            $0.width.equalTo(80.0)
        }
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
