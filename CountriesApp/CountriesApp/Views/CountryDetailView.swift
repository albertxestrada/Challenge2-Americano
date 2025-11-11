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

    @State private var showFlagInfo = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Flag
                if let url = URL(string: country.flags.png) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 180)
                            .cornerRadius(12)
                            .shadow(radius: 3)
                            .onTapGesture {
                                showFlagInfo = true
                            }
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
                Text(country.name.official)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 4) {
                    Text("Capital: \(country.displayCapital)")
                        .bold()
                        .foregroundStyle(.secondary)
                        
                }
             
                
                HStack(spacing: 16) {
                    InfoCard(title: "Region", value: country.region)
                    InfoCard(title: "Subregion", value: country.subregion ?? "_")
                    
                }
                
                HStack(spacing: 16) {
                    InfoCard(title: "Languages", value: country.displayLanguages)
                    InfoCard(title: "Currency", value: country.primaryCurrencyName+" "+country.primaryCurrencySymbol)
                    InfoCard(title: "Population", value: country.population.formatted(.number))
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
        .sheet(isPresented: $showFlagInfo) {
            VStack(spacing: 20) {
                Text("Flag Description")
                    .font(.title2.bold())
                
                Text(country.flags.alt ?? "No description available.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button("Close") {
                    showFlagInfo = false
                }
                .padding(.top, 10)
            }
            .padding()
            .presentationDetents([.medium])
        }

        .navigationTitle(country.name.common)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InfoCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.headline)
                .fontWeight(.medium)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 40)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
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
        ),
        subregion: "North America",
        population: 139000000,
        currencies: ["MXN": CountryModel.Currency(name: "Mexican Peso", symbol: "$")],
        languages: ["spa": "Spanish"]
        
    ))

}
