//
//  MapView.swift
//  FindCoronaCenter
//
//  Created by HYEONG SIK NAM on 2022/08/08.
//

import SwiftUI
import MapKit

struct AnnotaionItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordination: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var annotationItems = [AnnotaionItem]()
    var body: some View {
        Map(
            coordinateRegion: $region,
            annotationItems: [AnnotaionItem(coordinate: coordination)]
        ) { MapMarker(coordinate: $0.coordinate) }
        .onAppear {
            setRegion(coordination)
            setAnnotation(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        )
    }
    
    private func setAnnotation(_ coordinate: CLLocationCoordinate2D) {
        annotationItems = [AnnotaionItem(coordinate: coordinate)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .서울특별시, facilityName: "dsafas", address: "Fasfasd", lat: "37.12312", lng: "127.842394", centerType: .central, phoneNumber: "010-1234-1234")
        MapView(
            coordination: CLLocationCoordinate2D(
                latitude: CLLocationDegrees(center0.lat) ?? .zero,
                longitude: CLLocationDegrees(center0.lng) ?? .zero
            )
        )
    }
}
