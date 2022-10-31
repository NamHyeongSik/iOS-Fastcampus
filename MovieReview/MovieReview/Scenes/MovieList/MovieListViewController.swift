//
//  MovieListViewController.swift
//  MovieReview
//
//  Created by HYEONG SIK NAM on 2022/08/18.
//

import UIKit
import SnapKit

class MovieListViewController: UIViewController {
    private lazy var presenter = MovieListPresenter(viewController: self)

    private lazy var searchController = UISearchController()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = presenter
        collectionView.dataSource = presenter
        collectionView.register(MovieListCollectionViewCell.self, forCellWithReuseIdentifier: MovieListCollectionViewCell.identifier)
        return collectionView
    }()

    private lazy var searchResultTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = presenter
        tableView.dataSource = presenter

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillApper()
    }
}

extension MovieListViewController: MovieListProtocol {
    func setupNavigationBar() {
        navigationItem.title = "영화 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

    func setupSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = presenter
        navigationItem.searchController = searchController
    }

    func setupViews() {
        [collectionView, searchResultTableView].forEach {
            view.addSubview($0)
        }

        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        searchResultTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        searchResultTableView.isHidden = true
    }

    func updateTableView(isHidden: Bool) {
        searchResultTableView.isHidden = isHidden
        searchResultTableView.reloadData()
    }

    func pushToMovieDetailViewController(with movie: Movie) {
        let movieDetailVC = MovieDetailViewController(movie: movie)
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }

    func updateCollectionView() {
        collectionView.reloadData()
    }
}
