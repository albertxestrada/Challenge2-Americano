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
                            .shadow(
                                    color: .black.opacity(0.4), // Color y opacidad (40% de negro)
                                    radius: 15,                  // Nivel de desenfoque (suave y difuso)
                                    x: 0,                        // Sin desplazamiento horizontal
                                    y: 8                         // Ligeramente desplazada hacia abajo
                                )
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
                
                InfoCard(title: "Languages", value: country.displayLanguages)
                
                HStack(spacing: 16) {
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
            Image(systemName: "chevron.compact.down")
            VStack(spacing: 20) {
                Text("Flag Description")
                    .font(.title2.bold())
                
                Text(country.flags.alt ?? "No description available.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
            }
            .padding()
            .presentationDetents([.fraction(0.40)])
            
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
            alt: "The flag of Mexico is composed of three equal vertical bands of green, white and red, with the national coat of arms centered in the white band."
        ),
        subregion: "North America",
        population: 139000000,
        currencies: ["MXN": CountryModel.Currency(name: "Mexican Peso", symbol: "$")],
        languages: ["spa": "Spanish"]
        
    ))

}
