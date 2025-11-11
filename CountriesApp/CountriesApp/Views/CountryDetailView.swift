//
//  CountryDetailView.swift
//  CountriesApp
//
//  Created by Alberto Estrada on 05/11/25.
//

import SwiftUI
import MapKit

struct CountryDetailView: View {
    let country: CountryModel
    
    @State private var region: MapCameraPosition
    
    init(country: CountryModel) {
        self.country = country
        
        let lat = country.latitude
        let lng = country.longitude
        
        _region = State(initialValue: .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: lat, longitude: lng),
                span: MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 8)
            )
        ))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Flag
                if let url = URL(string: country.flags.png){
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 180)
                            .cornerRadius(12)
                            .shadow(radius: 3)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 180)
                    }
                        
                } else {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 180)
                }
                
                        
                // Country Name
                Text(country.name.common)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                
                // Capital and Region
                VStack(spacing: 4) {
                    Text("Capital: \(country.displayCapital)")
                        .foregroundStyle(.secondary)
                    Text("Region: \(country.region)")
                        .foregroundStyle(.secondary)
                }
                
              
                // Map
                Map(position: $region) {
                    Marker(country.name.common,
                           systemImage: "star.fill",
                           coordinate: CLLocationCoordinate2D(
                            latitude: country.latitude,
                            longitude: country.longitude
                           ))
                        .tint(.blue)
                }
                .mapStyle(.standard)
                .frame(height: 300)
                .cornerRadius(14)
                .shadow(radius: 4)
                
        
            }
            .padding()
        }
        .navigationTitle(Text(country.name.common))
        .navigationBarTitleDisplayMode(.inline)
    }
}


// Preview
#Preview {
    CountryDetailView(country: CountryModel(
        cca3: "MEX",
        name: CountryModel.Name(common: "Mexico", official: "United Mexican States"),
        capital: ["Mexico City"],
        region: "Americas",
        latlng: [19.4326, -99.1332],
        flags: CountryModel.Flags(
            svg: "https://flagcdn.com/w320/mx.svg",
            png: "https://flagcdn.com/w320/mx.png",
            alt: "Flag of Mexico"
        )
    ))

}
