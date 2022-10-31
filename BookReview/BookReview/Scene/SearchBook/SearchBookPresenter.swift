//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by HYEONG SIK NAM on 2022/08/17.
//

import UIKit

protocol SearchBookPorotocol {
    func setupViews()
    func dismiss()
    func reloadView()
}

protocol SearchBookDelegate {
    func selectBook(_ book: Book)
}

final class SearchBookPresenter: NSObject {
    private let viewController: SearchBookPorotocol
    private let bookSearchManager: BookSearchManagerProtocol
    private let delegate: SearchBookDelegate
    
    private var books = [Book]()
    
    init(
        viewController: SearchBookPorotocol,
        bookSearchManager: BookSearchManagerProtocol = BookSearchManager(),
        delegate: SearchBookDelegate
    ) {
        self.viewController = viewController
        self.bookSearchManager = bookSearchManager
        self.delegate = delegate
    }
    
    func viewDidLoad() {
        viewController.setupViews()
    }
}

extension SearchBookPresenter: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        bookSearchManager.request(from: searchText) { [weak self] newBooks in
            self?.books = newBooks
            self?.viewController.reloadView()
        }
    }
}

extension SearchBookPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = books[indexPath.row]
        delegate.selectBook(selectedBook)
        viewController.dismiss()
    }
}

extension SearchBookPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = books[indexPath.row].title
        return cell
    }
    
    
}
