//
//  CountryRow.swift
//  CountriesApp
//
//  Created by Alberto Estrada on 05/11/25.
//

import SwiftUI

struct CountryRow: View {
    
    let country: CountryModel
    
    var body: some View {
        HStack(spacing: 16) {
            if let flag = country.flagAssetName, UIImage(named: flag) != nil {
                Image(flag)
                    .resizable()
                    .aspectRatio(4/3, contentMode: .fit)
                    .frame(width: 70, height: 50)
                    .cornerRadius(6)
                    .shadow(radius: 1)
                
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(.systemGray5))
                        .frame(width: 70, height: 50)
                    Text(country.name.split(separator: " ").first.map { String($0.prefix(2)).uppercased() } ?? "")
                                .font(.headline)
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(country.name)
                    .font(.system(size: 18, weight: .semibold))
                Text(country.capital ?? "--")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    CountryRow(country: CountryModel(
        id: "MEX",
        name: "Mexico",
        capital: "Mexico City",
        region: "Americas",
        subregion: "North America",
        flagAssetName: "flag_mexico",
        lat: 19.4326,
        lng: -99.1332,
        population: 126_014_024,
        area: 1_964_375,
        currency: "MXN",
        language: "Spanish",
        timezone: "UTC-6",
        website: "https://www.gob.mx/"
    ))
}
