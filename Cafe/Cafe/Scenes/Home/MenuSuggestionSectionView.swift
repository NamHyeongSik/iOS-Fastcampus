//
//  MenuSuggestionSectionView.swift
//  Cafe
//
//  Created by HYEONG SIK NAM on 2022/08/09.
//

import SwiftUI

struct MenuSuggestionSectionView: View {
    @Binding var coffeeMenu: [CoffeeMenu]
    var body: some View {
        VStack {
            Text("\(User.shared.userName)님을 위한 추천메뉴")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16.0)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(coffeeMenu) { menu in
                        MenuSuggestionItemView(coffeMenu: menu)
                    }
                }
                .padding(.horizontal, 16.0)
            }
        }
    }
}

struct MenuSuggestionItemView: View {
    let coffeMenu: CoffeeMenu
    var body: some View {
        VStack {
            coffeMenu.image
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .clipShape(Circle())
            Text(coffeMenu.name)
                .font(.caption)
        }
    }
}
