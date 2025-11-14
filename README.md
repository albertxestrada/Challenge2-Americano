# Challenge2-Americano

🌍 CountriesApp
A SwiftUI application inspired by Been, designed to explore countries around the world using live data from the REST Countries API.
📌 Overview
CountriesApp is an iOS application built with SwiftUI that allows users to explore detailed information about every country, including its flag, capital, region, population, languages, currency, and more — all retrieved dynamically from the REST Countries API v3.1.
This project was developed as a learning exercise to practice:
Consuming REST APIs in SwiftUI
Modeling JSON data using Codable
Designing clean UIs following Apple Human Interface Guidelines
Managing state with MVVM
Displaying maps using MapKit
Inspired by the "Explore" section in the Been app, this project focuses on transforming static geographical data into a dynamic, interactive experience.
✨ Features
✔ Explore all countries
Loads all countries from the REST Countries API
Displays flags, names, capitals, and regions
Sorts countries alphabetically
✔ Country detail view
High-resolution flag display
Official name and basic info
Region & subregion
Population
Languages
Currencies (name + symbol)
Interactive map pin (MapKit)
✔ Clean UI & Apple-style interaction
Minimalist design inspired by Apple’s Human Interface Guidelines
Info cards that adapt text size automatically
Smooth layout optimized for readability
🏛 Architecture
The app follows a MVVM (Model-View-ViewModel) structure:
Model
CountryModel
Submodels: Name, Flags, Currency
Mirrors only the fields requested from the API (required for /all endpoint)
ViewModel
CountryViewModel
Handles API call
Decodes JSON into Swift types
Publishes list of countries to the UI
Views
CountryListView
CountryRow
CountryDetailView (with MapKit)
RegionPicker
🌐 API
Data is fetched from:
https://restcountries.com/v3.1/all?fields=name,capital,region,subregion,latlng,flags,population,currencies,languages
The fields parameter is required for the /all endpoint.
🛠 Technologies Used
Swift
SwiftUI
Combine
MapKit
REST Countries API v3.1
MVVM architecture
🚀 Next Steps
Planned improvements include:
🟦 New Features
Add “Visited Countries” functionality
Add interactive world map view
Implement flag-detail screen (meaning, symbolism)
Add filters (region, population, language)
Add "Compare Countries" feature
🟦 UI/UX Enhancements
More Apple-style animations
Improved layout hierarchy
Dark Mode refinements
Better spacing & typography
🟦 Technical Improvements
Add caching or offline mode
Add proper error states & loading indicators
Expand accessibility support
VoiceOver
Dynamic Type
Clearer alt text
📁 Project Structure
CountriesApp/
├── Models/
│   └── CountryModel.swift
├── ViewModels/
│   └── CountryViewModel.swift
├── Views/
│   ├── CountryListView.swift
│   ├── CountryRow.swift
│   ├── CountryDetailView.swift
│   └── RegionPicker.swift
└── CountriesAppApp.swift
📸 Screenshots
(Add screenshots once you have them)
💡 Inspiration
This project was heavily inspired by the Been app, specifically the “Explore” feature. The goal was to bring a similar global-overview experience but powered with live data instead of static content — giving users access to real-time information for every country.
🔗 Repository
(Add your repo link here)
📬 Contact
Created by Alberto Estrada
Feel free to reach out or open an issue for improvements!
