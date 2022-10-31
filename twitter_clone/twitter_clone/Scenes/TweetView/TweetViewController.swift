//
//  TweetViewController.swift
//  twitter_clone
//
//  Created by HYEONG SIK NAM on 2022/09/26.
//

import SnapKit
import UIKit

final class TweetViewController: UIViewController {
    private var presenter: TweetPresenter!
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        imageView.layer.cornerRadius = 30.0
        
        return imageView
    }()
    
    private lazy var writerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var writerAccountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.like.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.share.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    init(tweet: Tweet) {
        super.init(nibName: nil, bundle: nil)
        
        presenter = TweetPresenter(viewController: self, tweet: tweet)
        view.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidload()
    }
}

extension TweetViewController: TweetProtocol {
    func setTweet(tweet: Tweet) {
        writerNameLabel.text = tweet.user.name
        writerAccountLabel.text = "@\(tweet.user.account)"
        contentsLabel.text = tweet.contents
    }
    
    func setupViews() {
        let userinfoStackView = UIStackView(
            arrangedSubviews: [writerNameLabel, writerAccountLabel]
        )
        userinfoStackView.axis = .vertical
        userinfoStackView.distribution = .equalSpacing
        userinfoStackView.spacing = 4.0
        
        let buttonStackView = UIStackView(
            arrangedSubviews: [likeButton, shareButton]
        )
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        [
            profileImageView, userinfoStackView, contentsLabel, buttonStackView
        ].forEach { view.addSubview($0) }
        
        let superViewMargin: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superViewMargin)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(superViewMargin)
            $0.width.height.equalTo(60.0)
        }
        
        userinfoStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8.0)
            $0.trailing.equalToSuperview().inset(superViewMargin)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalTo(userinfoStackView.snp.trailing)
            $0.top.equalTo(profileImageView.snp.bottom).offset(8.0)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(contentsLabel.snp.leading)
            $0.trailing.equalTo(contentsLabel.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset (superViewMargin)
        }
    }
}
