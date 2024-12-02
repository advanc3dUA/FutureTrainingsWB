//
//  MapView.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 02.12.24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        return MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    }()
    private let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        //MAP 1
        //Map(coordinateRegion: $region)
        
        //MAP 2
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            // 1 OLD (DEPRICATED in 16)
            //MapPin(coordinate: location.location, tint: .accent)
            
            // 2 MARKERS NEW STYLE (DEPRICATED in 17)
            //MapMarker(coordinate: location.location, tint: .accent)
            
            // 3 CUSTOM ANNOTATIONS (DEPRICATED in 17)
            MapAnnotation(coordinate: location.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }//: ANNOTATION
        }
    }
}

#Preview {
    MapView()
}
