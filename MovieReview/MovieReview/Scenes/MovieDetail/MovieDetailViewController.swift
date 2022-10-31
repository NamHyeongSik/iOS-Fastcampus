//
//  MovieDetailViewController.swift
//  MovieReview
//
//  Created by HYEONG SIK NAM on 2022/08/18.
//

import UIKit
import SnapKit
import Kingfisher

final class MovieDetailViewController: UIViewController {
    private var presenter: MovieDetailPresenter!

    private lazy var rightBarButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "star"),
        style: .plain,
        target: self,
        action: #selector(didTapRightBarButtonItem)
    )

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .secondarySystemBackground

        return imageView
    }()

    init(movie: Movie) {
        super.init(nibName: nil, bundle: nil)
        presenter = MovieDetailPresenter(viewController: self, movie: movie)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension MovieDetailViewController: MovieDetailProtocol {
    func setViews(with movie: Movie) {
        view.backgroundColor = .systemBackground
        navigationItem.title = movie.title
        navigationItem.rightBarButtonItem = rightBarButtonItem

        let userRatingContentStackView = MovieContentsStackView(title: "평점", content: movie.userRating)
        let actorContentStackView = MovieContentsStackView(title: "배우", content: movie.actor)
        let directorContentStackView = MovieContentsStackView(title: "감독", content: movie.director)
        let pubDateContentStackView = MovieContentsStackView(title: "제작년도", content: movie.pubDate)

        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 8.0

        [
            userRatingContentStackView,
            actorContentStackView,
            directorContentStackView,
            pubDateContentStackView
        ].forEach {
            contentStackView.addArrangedSubview($0)
        }

        [imageView, contentStackView].forEach {
            view.addSubview($0)
        }

        let inset: CGFloat = 16.0

        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(inset)
            $0.leading.trailing.equalToSuperview().inset(inset)
            $0.height.equalTo(imageView.snp.width)
        }

        if let imageURL = movie.imageURL {
            imageView.kf.setImage(with: imageURL)
        }

        contentStackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(imageView)
            $0.top.equalTo(imageView.snp.bottom).offset(inset)
        }
    }

    func setRightBarButton(with isLiked: Bool) {
        let imageName = isLiked ? "star.fill" : "star"
        rightBarButtonItem.image = UIImage(systemName: imageName)
    }
}

private extension MovieDetailViewController {
    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButtonItem()
    }
}
