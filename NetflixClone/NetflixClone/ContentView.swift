//
//  ContentView.swift
//  NetflixClone
//
//  Created by HYEONG SIK NAM on 2022/05/18.
//

import SwiftUI

struct ContentView: View {
    let titles = ["Netflix"]
    
    var body: some View {
        NavigationView {
            List(titles, id: \.self) {
                let netflixVC = HomeViewControllerRepresentable().navigationBarHidden(true).edgesIgnoringSafeArea(.all)
                NavigationLink($0, destination: netflixVC)
            }
            .navigationTitle("SwiftUI to UIKit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
