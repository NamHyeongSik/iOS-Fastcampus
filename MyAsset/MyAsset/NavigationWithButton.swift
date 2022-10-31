//
//  NavigationWithButton.swift
//  MyAsset
//
//  Created by HYEONG SIK NAM on 2022/05/23.
//

import SwiftUI

struct NavigationWithButton: ViewModifier {
    var title: String = ""
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(title)
                        .font(.system(size: 24, weight: .bold))
                        .padding()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("자산 추가 버튼 tapped")
                    } label: {
                        Image(systemName: "plus")
                        Text("자산추가")
                            .font(.system(size: 12))
                    }
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black)
                    )
                }
            }
            .padding(.top)
            .accentColor(.black)
    }
}

extension View {
    func navigationBarWithButtonStyle(_ title: String) -> some View {
        return self.modifier(NavigationWithButton(title: title))
    }
}

struct NavigationWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigationBarWithButtonStyle("내 자산")
        }
//        NavigationWithButton()
    }
}
