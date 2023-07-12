//
//  CategoryBooks.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 12/7/2023.
//

import SwiftUI

struct CategoryBooks: View {
//    @EnvironmentObject var cartManager: CartManager
//    @Environment(\.presentationMode) var presentationMode
    
//    @StateObject var cartManager = CartManager()
//    @Binding var productList: [Product]
//
//    @State var bookList: [Product] = [
//         Product(name: "Textbook", image: UIImage(named: "1"), price: 30, contact: "12345", description:"Bought in 2021, use<1 year"),
//    Product(name: "Tutorial", image: UIImage(named: "2"), price: 20, contact: "12334", description:"Bought in 2022")
//    ]
////
//    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
//
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 20) {
//                    ForEach(bookList, id: \.id) { product in
//                        Card(product: product)
//                            .environmentObject(cartManager)
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle(Text("Books"))
//
//
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//    }
    
    
    
    @StateObject var cartManager = CartManager()
    
    @State var productList: [Product] = [
        Product(name: "Textbook", image: UIImage(named: "1"), price: 30, contact: "12345", description:"Bought in 2021, use<1 year", category: "Book"),
               Product(name: "Tutorial", image: UIImage(named: "2"), price: 20, contact: "12334", description:"Bought in 2022", category: "Book")
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
            .navigationTitle(Text("Books"))
            
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

struct CategoryBooks_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBooks()
            .environmentObject(CartManager())
    }
}
