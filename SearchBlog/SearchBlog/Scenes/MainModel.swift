//
//  MainModel.swift
//  SearchBlog
//
//  Created by HYEONG SIK NAM on 2022/07/22.
//

import UIKit
import RxSwift

struct MainModel {
    let network = SearchBlogNetwork()
    
    func searchBlog(_ query: String) -> Single<Result<Blog, SearchNetworkError>> {
        return network.searchBlog(query: query)
    }
    
    func getBlogValue(_ result: Result<Blog, SearchNetworkError>) -> Blog? {
        guard case .success(let value) = result else { return nil }
        return value
    }
    
    func getBlogError(_ result: Result<Blog, SearchNetworkError>) -> String? {
        guard case .failure(let error) = result else { return nil }
        return error.localizedDescription
    }
    
    func getBlogListCellData(_ value: Blog) -> [BlogListCellData] {
        return value.documents
            .map { doc in
                let thumbnailURL = URL(string: doc.thumbnail ?? "")
                return BlogListCellData(
                    thumbnailURL: thumbnailURL,
                    name: doc.name,
                    title: doc.title,
                    dateTime: doc.datetime
                )
            }
    }
    
    func sort(by type: MainViewController.AlertAction, of data: [BlogListCellData]) -> [BlogListCellData] {
        switch type {
        case .title:
            return data.sorted { $0.title ?? "" < $1.title ?? "" }
        case .datetime:
            return data.sorted { $0.dateTime ?? Date() > $1.dateTime ?? Date() }
        default:
            return data
        }
    }
}
