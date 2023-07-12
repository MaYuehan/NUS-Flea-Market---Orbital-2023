//
//  CategoryOther.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 12/7/2023.
//

import SwiftUI

struct CategoryOther: View {
    @StateObject var cartManager = CartManager()
    
    @State var productList: [Product] = [
        Product(name: "NUS badge", image: UIImage(named: "1"), price: 8, contact: "12345", description:"new badge, not used, original price 15$", category: "Other"),
        
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
            .navigationTitle(Text("Other"))
            
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

struct CategoryOther_Previews: PreviewProvider {
    static var previews: some View {
        CategoryOther()
    }
}
