//
//  CategoryClothes.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 12/7/2023.
//

import SwiftUI

struct CategoryClothes: View {
    @StateObject var cartManager = CartManager()
    
    @State var productList: [Product] = [
        Product(name: "Swimsuit", image: UIImage(named: "1"), price: 30, contact: "12345", description:"original price 85, blue, size M for girl", category: "Clothes"),
        Product(name: "Jeans", image: UIImage(named: "2"), price: 35, contact: "12334", description:"Bought in 2022, light blue, size M, lentgh: 107cm", category: "Clothes")
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
            .navigationTitle(Text("Clothes"))
            
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

struct CategoryClothes_Previews: PreviewProvider {
    static var previews: some View {
        CategoryClothes()
    }
}
