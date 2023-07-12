//
//  CategoryElectrical.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 12/7/2023.
//

import SwiftUI

struct CategoryElectrical: View {
    @StateObject var cartManager = CartManager()
    
    @State var productList: [Product] = [
        Product(name: "Phone", image: UIImage(named: "1"), price: 800, contact: "12345", description:"Bought in 2021,white, iphone12", category: "Electronic"),
        Product(name: "Laptop", image: UIImage(named: "2"), price: 800, contact: "12334", description:"Bought in 2022, light gray, 13inch", category: "Electronic")
    ]
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    @State private var showAddItemsView = false
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        Card(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Electronics"))
            
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CartView().environmentObject(cartManager)) {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                }
                
            }
            .sheet(isPresented: $showAddItemsView) {
                AddItemsView(productList: $productList)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CategoryElectrical_Previews: PreviewProvider {
    static var previews: some View {
        CategoryElectrical()
    }
}
