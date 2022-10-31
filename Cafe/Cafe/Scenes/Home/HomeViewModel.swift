//
//  HomeViewModel.swift
//  Cafe
//
//  Created by HYEONG SIK NAM on 2022/08/10.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isNeedToReload = false {
        didSet {
            guard isNeedToReload else { return }

            coffeeMenu.shuffle()
            events.shuffle()
            
            isNeedToReload = false
        }
    }
    
    @Published var coffeeMenu: [CoffeeMenu] = [
        CoffeeMenu(image: Image("coffee"), name: "아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "카페라때"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 카페라때"),
        CoffeeMenu(image: Image("coffee"), name: "카푸치노"),
        CoffeeMenu(image: Image("coffee"), name: "에이드")
    ]
    
    @Published var events: [Event] = [
        Event(image: Image("coffee"), title: "말차라떼", description: "제주산"),
        Event(image: Image("coffee"), title: "초코라떼", description: "카카오"),
        Event(image: Image("coffee"), title: "감귤쥬스", description: "제주산"),
        Event(image: Image("coffee"), title: "오곡라떼", description: "통곡물"),
        Event(image: Image("coffee"), title: "아이스티", description: "복숭아")
    ]
}

