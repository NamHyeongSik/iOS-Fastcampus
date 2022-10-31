//
//  CategoryViewModel.swift
//  UsedMarket
//
//  Created by HYEONG SIK NAM on 2022/07/28.
//

import RxSwift
import RxCocoa

struct CategoryViewModel {
    let disposeBag = DisposeBag()
    
    //ViewModel -> View
    let cellData: Driver<[Category]>
    let pop: Signal<Void>
    
    //View -> ViewModel
    let itemSelected = PublishRelay<Int>()
    
    //ViewModel -> ParentsViewModel
    let selectedCategory = PublishSubject<Category>()
    
    init() {
        let categories = [
            Category(id: 1, name: "디지털/가전"),
            Category(id: 2, name: "게임"),
            Category(id: 3, name: "스포츠/레저"),
            Category(id: 4, name: "유아/아동용품"),
            Category(id: 5, name: "가구")
        ]
        
        self.cellData = Driver.just(categories)
        
        self.itemSelected
            .map { categories[$0] }
            .bind(to: selectedCategory)
            .disposed(by: disposeBag)
    
        self.pop = itemSelected
            .map{ _ in Void() }
            .asSignal(onErrorSignalWith: .empty())
    }
}
