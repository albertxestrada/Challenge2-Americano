//
//  SearchBar.swift
//  CountriesApp
//
//  Created by Alberto Estrada on 05/11/25.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    var placeholder: String = "Search Country..."
    
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            TextField(placeholder, text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .padding(10)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding(.horizontal)
        
    }
}

#Preview {
    SearchBar(text: .constant(""))
}
