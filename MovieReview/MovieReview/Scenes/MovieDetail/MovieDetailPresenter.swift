//
//  MovieDetailPresenter.swift
//  MovieReview
//
//  Created by HYEONG SIK NAM on 2022/08/18.
//

import UIKit

protocol MovieDetailProtocol: AnyObject {
    func setViews(with movie: Movie)
    func setRightBarButton(with isLiked: Bool)
}

final class MovieDetailPresenter: NSObject {
    private weak var viewController: MovieDetailProtocol?
    private let userDefaultsManager: UserDefaultsProtocol

    private var movie: Movie

    init(
        viewController: MovieDetailProtocol,
        movie: Movie,
        userDefaultsManager: UserDefaultsProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.movie = movie
        self.userDefaultsManager = userDefaultsManager
    }

    func viewDidLoad() {
        viewController?.setViews(with: movie)
        viewController?.setRightBarButton(with: movie.isLiked)
    }

    func didTapRightBarButtonItem() {
        movie.isLiked.toggle()
        if movie.isLiked {
            userDefaultsManager.addMovie(movie)
        } else {
            userDefaultsManager.removeMovie(movie)
        }
        viewController?.setRightBarButton(with: movie.isLiked)
    }
}
