//
//  SearchView.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 6/7/2023.
//

import SwiftUI

struct SearchView: View {
    @Binding var productList: [Product]
    @EnvironmentObject var cartManager: CartManager

    @State private var selectedSortOption: String = "All"
    @State private var searchText: String = ""

    private let categories = ["All", "Book", "Stationery", "Furniture", "Electronic", "Clothes", "Daily Use", "Other"]

    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)

            Picker("Sort by", selection: $selectedSortOption) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .tag(category)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            List {
                ForEach(filteredProducts) { product in
                    Card(product: product)
                        .environmentObject(cartManager)
                }
            }
        }
        .navigationTitle(Text("Search"))
    }

    private var filteredProducts: [Product] {
        let lowercasedSearchText = searchText.lowercased()

        return productList.filter { product in
            let isInSelectedCategory = selectedSortOption == "All" || product.category == selectedSortOption
            let matchesSearchText = searchText.isEmpty ||
                product.name.lowercased().contains(lowercasedSearchText) ||
                product.description.lowercased().contains(lowercasedSearchText) ||
                product.contact.lowercased().contains(lowercasedSearchText)
            
            return isInSelectedCategory && matchesSearchText
        }
    }
}
