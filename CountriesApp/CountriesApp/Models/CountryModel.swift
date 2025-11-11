//
//  CountryModel.swift
//  CountriesApp
//
//  Created by Alberto Estrada on 05/11/25.
//

import Foundation
import SwiftUI

struct CountryModel: Identifiable {
    let id: String
    let name: String
    let capital: String?         // Optional
    let region: String
    let subregion: String?       // Optional
    let flagAssetName: String?   // Optional
    let lat: Double
    let lng: Double
    let population: Int?         // Optional
    let area: Double?            // Optional, in km²
    let currency: String?        // Optional
    let language: String?        // Optional
    let timezone: String?        // Optional
    let website: String?         // Optional
}
