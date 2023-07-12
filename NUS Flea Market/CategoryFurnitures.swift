//
//  CategoryFurnitures.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 12/7/2023.
//

import SwiftUI

struct CategoryFurnitures: View {
    @StateObject var cartManager = CartManager()
    
    @State var productList: [Product] = [
        Product(name: "Table", image: UIImage(named: "1"), price: 80, contact: "12345", description:"Bought in 2021, brown, 80*100"),
        Product(name: "Chair", image: UIImage(named: "2"), price: 30, contact: "12334", description:"Bought in 2020, light yellow, height 80cm")
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
            .navigationTitle(Text("Furnitures"))
            
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

struct CategoryFurnitures_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFurnitures()
    }
}
