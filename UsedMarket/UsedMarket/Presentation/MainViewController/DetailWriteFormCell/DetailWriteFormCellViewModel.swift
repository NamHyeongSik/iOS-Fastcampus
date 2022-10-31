//
//  DetailWriteFormCellViewModel.swift
//  UsedMarket
//
//  Created by HYEONG SIK NAM on 2022/07/28.
//

import RxSwift
import RxCocoa

struct DetailWriteFormCellViewModel {
    //View -> ViewModel
    let contentValue = PublishRelay<String?>()
}
