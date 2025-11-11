//
//  CountryViewModel.swift
//  CountriesApp
//
//  Created by Alberto Estrada on 05/11/25.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    @Published var countries: [CountryModel] = []
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchCountries()
    }
    
    func fetchCountries() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all?fields=name,cca3,capital,region,subregion,latlng,flags") else { return }
        isLoading = true
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [CountryModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    print("Error fetching: \(error)")
                }
            }, receiveValue: { countries in
                self.countries = countries.sorted { $0.name.common < $1.name.common }
            })
            .store(in: &cancellables)
    }
    
    var availableRegions: [String] {
            let regionsSet = Set(countries.map { $0.region }.filter { !$0.isEmpty })
            return [""] + regionsSet.sorted()
        }
}
