//
//  RegionPicker.swift
//  CountriesApp
//
//  Created by Alberto Estrada on 05/11/25.
//

import SwiftUI

struct RegionPicker: View {
    @Binding var selectedRegion: String
    let regions: [String] = ["", "Africa", "Americas", "Asia", "Europe", "Oceania"]
    
    @ViewBuilder
    func roundedBackground(for region: String) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(selectedRegion == region ? Color.blue : Color(.systemGray5))
    }

    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            
            HStack(spacing: 10) {
                ForEach(regions, id: \.self) { r in
                    Text(r.isEmpty ? "All" : r)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(
                            roundedBackground(for: r)
                        )
                        .foregroundColor(selectedRegion == r ? .white : .blue)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedRegion = r
                            }
                        }
                }
            }
            .padding(.horizontal)
        }

    }
}

#Preview {
    RegionPicker(selectedRegion: .constant("Americas"))
        
}

