//
//  CenterDetailView.swift
//  FindCoronaCenter
//
//  Created by HYEONG SIK NAM on 2022/08/08.
//

import SwiftUI

struct CenterDetailView: View {
    var center: Center
    var body: some View {
        VStack {
            MapView(coordination: center.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            CenterRow(center: center)
        }
        .navigationTitle(center.facilityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CenterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .서울특별시, facilityName: "dsafas", address: "Fasfasd", lat: "37.12312", lng: "127.842394", centerType: .central, phoneNumber: "010-1234-1234")
        CenterDetailView(center: center0)
    }
}
