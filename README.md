# 🌍 World Explorer

A SwiftUI App Powered by the REST Countries API

World Explorer is an iOS app built in SwiftUI that lets users explore
every country in the world through a clean, modern, Apple-style
interface.\
The app fetches live data from the **REST Countries API**, allowing
users to see updated information such as population, region, languages,
currencies, maps, and flags.

Inspired by the **"Been" app**, World Explorer focuses on providing a
similar exploration experience --- but enriched with real-time country
data instead of static content.

## 📸 Features

### ✔ Explore All Countries

-   Scroll through a full list of countries.
-   Beautiful card layout with flags and key info.

### ✔ Search Bar

-   Filter countries instantly by name.

### ✔ Region Picker

-   Browse countries by continent/region.

### ✔ Country Detail View

-   Flag with alt-text description
-   Population, capital, subregion
-   Currencies and languages
-   High-resolution SVG images
-   Interactive map coordinates

### ✔ Modern Apple-Style UI

-   Inspired by Apple Human Interface Guidelines
-   Clean typography, spacing, and minimalism

## 🏗 Tech Stack

-   **SwiftUI** -- Declarative UI framework
-   **REST Countries API v3.1** -- Live world data
-   **MVVM Architecture** -- Clean data flow
-   **Async/await Networking** -- Modern, efficient API calls
-   **Codable Models** -- Decoding structured JSON safely

## 🎯 Learning Goals

This project was created to practice:

-   Using **API calls** in SwiftUI
-   Working with async/await
-   Parsing complex JSON (nested objects, dictionaries, arrays)
-   Structuring an app using **MVVM**
-   Designing clean views following Apple's guidelines
-   Handling errors and loading states
-   Passing data between views

## 📁 Project Structure

    CountriesApp
    │
    ├── CountriesAppApp.swift
    │
    ├── Models
    │   ├── CountryModel.swift
    │   └── CountryViewModel.swift
    │
    ├── Components
    │   ├── SearchBar.swift
    │   ├── RegionPicker.swift│   
    │
    ├── Views
    │   ├── ContentView.swift
    │   ├── CountryRow.swift
    │   └── CountryDetailView.swift
    │
    └── Resources
        └── Assets.xcassets


## 🚀 Next Steps

Future improvements include:

### ✨ UI Enhancements

-   More polished animations
-   A new interactive map view
-   Better flag modal with zoom and transitions

### ✨ New Features

-   Track visited countries (inspired by Been)
-   User profile & preferences
-   Offline caching
-   Save favorite countries
-   Statistics dashboard (continents visited, languages spoken)

### ✨ Technical Additions

-   Implement error-specific UI states
-   Improve JSON handling for large datasets
-   Add unit tests (ViewModel + API layer)

## 🔗 GitHub Repository

Paste this README inside your repo.

## 🙌 Credits

-   Built by **Alberto Estrada**
-   Inspired by the "Been" exploration interface
-   Data provided by **REST Countries API**
