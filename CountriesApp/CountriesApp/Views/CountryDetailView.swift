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
        _region = State(initialValue: .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: country.lat, longitude: country.lng),
                span: MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 8)
            )
        ))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Flag
                if let flag = country.flagAssetName, UIImage(named: flag) != nil {
                    Image(flag)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 180)
                        .cornerRadius(12)
                        .shadow(radius: 3)
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 180)
                }
                
                // Country Name
                Text(country.name)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                
                // Capital and Region
                VStack(spacing: 4) {
                    Text("Capital: \(country.capital ?? "—")")
                        .foregroundStyle(.secondary)
                    Text("Region: \(country.region)\(country.subregion.map { " / \($0)" } ?? "")")
                        .foregroundStyle(.secondary)
                }
                
                // Quick Info Cards
                HStack(spacing: 16) {
                    InfoCard(title: "Population", value: country.population?.formatted() ?? "—")
                    InfoCard(title: "Area", value: country.area.map { "\($0.formatted()) km²" } ?? "—")
                }
                HStack(spacing: 16) {
                    InfoCard(title: "Currency", value: country.currency ?? "—")
                    InfoCard(title: "Language", value: country.language ?? "—")
                    InfoCard(title: "Timezone", value: country.timezone ?? "—")
                }
                
                // Map
                Map(position: $region) {
                    Marker(country.name,
                           systemImage: "star.fill",
                           coordinate: CLLocationCoordinate2D(latitude: country.lat,
                                                              longitude: country.lng))
                        .tint(.blue)
                }
                .mapStyle(.standard)
                .frame(height: 300)
                .cornerRadius(14)
                .shadow(radius: 4)
                
                // Action Buttons
                VStack(spacing: 12) {
                    if let website = country.website, let url = URL(string: website) {
                        Link(destination: url) {
                            Text("Visit Official Website")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                        }
                    }
                    
                    Button {
                        // Share action
                    } label: {
                        Label("Share Country", systemImage: "square.and.arrow.up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .foregroundColor(.primary)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(Text(country.name))
        .navigationBarTitleDisplayMode(.inline)
    }
}

// InfoCard Component
struct InfoCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
}

// Preview
#Preview {
    CountryDetailView(country: CountryModel(
        id: "MEX",
        name: "Mexico",
        capital: "Mexico City",
        region: "Americas",
        subregion: "North America",
        flagAssetName: "flag_mexico",
        lat: 19.4326,
        lng: -99.1332,
        population: 126014024,
        area: 1964375,
        currency: "MXN",
        language: "Spanish",
        timezone: "UTC-6",
        website: "https://www.gob.mx/"
    ))
}
