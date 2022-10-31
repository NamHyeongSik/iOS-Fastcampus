//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by HYEONG SIK NAM on 2022/08/17.
//

import UIKit

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func showCloseAlert()
    func close()
    func setupViews()
    func presentToSearchBookViewController()
    func updateViews(title: String, imageURL: URL?)
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    private let userDefaultsManager: UserDefaultsManagerProtocol
    var book: Book?
    
    init(
        viewController: ReviewWriteProtocol,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func didTapLeftBarButton() {
        viewController.showCloseAlert()
    }
    
    func didTapRightBarButton(contentsText: String?) {
        guard let book = book,
              let contentsText = contentsText else { return }
        //TODO: save버튼 비활성화
        let bookReview = BookReview(title: book.title, content: contentsText, imageURL: book.imageURL)
        userDefaultsManager.setReview(bookReview)
        viewController.close()
    }
    
    func didTapTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectBook(_ book: Book) {
        self.book = book
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
