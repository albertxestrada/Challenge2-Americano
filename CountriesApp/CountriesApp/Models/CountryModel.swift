//
//  CountryModel.swift
//  CountriesApp
//
//  Created by Alberto Estrada on 05/11/25.
//

import Foundation
import SwiftUI

struct CountryModel: Identifiable, Codable {
    var id: String { cca3 }
    let cca3: String
    let name: Name
    let capital: [String]?        
    let region: String
    let latlng: [Double]
    let flags: Flags
    
    struct Name: Codable {
        let common: String
        let official: String
    }
    
    struct Flags: Codable {
        let svg: String
        let png: String
        let alt: String?
    }
    
    var displayCapital: String {
        capital?.first ?? "N/A"
    }
    
    var latitude: Double { latlng.first ?? 0 }
    var longitude: Double { latlng.last ?? 0 }
}
