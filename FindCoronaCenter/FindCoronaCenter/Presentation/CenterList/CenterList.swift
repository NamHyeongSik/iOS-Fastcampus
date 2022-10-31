//
//  CenterList.swift
//  FindCoronaCenter
//
//  Created by HYEONG SIK NAM on 2022/08/08.
//

import SwiftUI

struct CenterList: View {
    var centers = [Center]()
    var body: some View {
        List(centers, id: \.id) { center in
            NavigationLink(destination: CenterDetailView(center: center)) {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
        let centers = [Center(id: 0, sido: .서울특별시, facilityName: "dsafas", address: "Fasfasd", lat: "37.12312", lng: "127.842394", centerType: .central, phoneNumber: "010-1234-1234")]
        CenterList(centers: centers)
    }
}
