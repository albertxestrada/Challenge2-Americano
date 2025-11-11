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
        HStack {
            if let flagURL = URL(string: country.flags.png) {
                AsyncImage(url: flagURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 30)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                
                VStack(alignment: .leading) {
                    Text(country.name.common)
                        .font(.headline)
                    Text(country.displayCapital)
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    CountryRow(country: CountryModel(
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
