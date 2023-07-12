//
//  CategoryStationery.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 12/7/2023.
//

import SwiftUI

struct CategoryStationery: View {
    @StateObject var cartManager = CartManager()
    
    @State var productList: [Product] = [
        Product(name: "NoteBook", image: UIImage(named: "1"), price: 10, contact: "12345", description:"150 pages, brown cover, A4", category: "Stationery"),
        Product(name: "Pen", image: UIImage(named: "2"), price: 1, contact: "12334", description:"black polit pen, orginal price 3.5", category: "Stationery")
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
            .navigationTitle(Text("Stationeries"))
            
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

struct CategoryStationery_Previews: PreviewProvider {
    static var previews: some View {
        CategoryStationery()
    }
}
