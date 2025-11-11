//
//  ContentView.swift
//  CountriesApp
//
//  Created by Alberto Estrada on 05/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText: String = ""
    @State private var selectedRegion: String = ""
    @StateObject private var viewModel = CountryViewModel()
    
    var filtered: [CountryModel] {
        viewModel.countries.filter { c in
            (selectedRegion.isEmpty || c.region.lowercased() == selectedRegion.lowercased()) &&
            (searchText.isEmpty || c.name.common.lowercased().contains(searchText.lowercased()))
        }
    }
    
   
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                HStack {
                    Text("Countries")
                        .font(.largeTitle.bold())
                    Spacer()
                }
                .padding(.horizontal)
                
                SearchBar(text: $searchText)
                
                RegionPicker(
                    selectedRegion: $selectedRegion,
                    regions: viewModel.availableRegions
                )
                
                List {
                    ForEach(filtered) { country in
                        NavigationLink(destination: CountryDetailView(country: country)) {
                            CountryRow(country: country)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}


