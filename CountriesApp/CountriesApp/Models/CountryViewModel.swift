//
//  CountryViewModel.swift
//  CountriesApp
//
//  Created by Alberto Estrada on 05/11/25.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    @Published var countries: [CountryModel] = [
        CountryModel(
            id: "ARG",
            name: "Argentina",
            capital: "Buenos Aires",
            region: "Americas",
            subregion: "South America",
            flagAssetName: "flag_argentin",
            lat: -34.6037,
            lng: -58.3816,
            population: 45195777,
            area: 2780400,
            currency: "ARS",
            language: "Spanish",
            timezone: "UTC-3",
            website: "https://www.argentina.gob.ar/"
        ),
        CountryModel(
            id: "BRA",
            name: "Brazil",
            capital: "Brasilia",
            region: "Americas",
            subregion: "South America",
            flagAssetName: "flag_brazil",
            lat: -15.7939,
            lng: -47.8828,
            population: 213993437,
            area: 8515767,
            currency: "BRL",
            language: "Portuguese",
            timezone: "UTC-3",
            website: "https://www.gov.br/"
        ),
        CountryModel(
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
        ),
        CountryModel(
            id: "ESP",
            name: "Spain",
            capital: "Madrid",
            region: "Europe",
            subregion: "Southern Europe",
            flagAssetName: "flag_spain",
            lat: 40.4168,
            lng: -3.7038,
            population: 47351567,
            area: 505990,
            currency: "EUR",
            language: "Spanish",
            timezone: "UTC+1",
            website: "https://www.lamoncloa.gob.es/"
        ),
        CountryModel(
            id: "JPN",
            name: "Japan",
            capital: "Tokyo",
            region: "Asia",
            subregion: "Eastern Asia",
            flagAssetName: "flag_japan",
            lat: 35.6895,
            lng: 139.6917,
            population: 125960000,
            area: 377975,
            currency: "JPY",
            language: "Japanese",
            timezone: "UTC+9",
            website: "https://www.japan.go.jp/"
        ),
        CountryModel(
            id: "AUS",
            name: "Australia",
            capital: "Sydney",
            region: "Oceania",
            subregion: "Australia and New Zealand",
            flagAssetName: "flag_autralia",
            lat: -33.8688,
            lng: 151.2093,
            population: 25687041,
            area: 7692024,
            currency: "AUD",
            language: "English",
            timezone: "UTC+10",
            website: "https://www.australia.gov.au/"
        )
    ]
}
