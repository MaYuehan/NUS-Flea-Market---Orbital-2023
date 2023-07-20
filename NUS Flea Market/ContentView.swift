import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()

    @State var productList: [Product] = [
        // ... existing product data ...
    ]

    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    @State private var showAddItemsView = false
    @State private var showSettingsView = false
    @State private var showSearchView = false // New state variable for the SearchView

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
            .navigationTitle(Text("NUS Flea Market"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showSettingsView = true
                    }) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.purple)
                            .padding()
                            .frame(width: 60, height: 60)
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    // Navigate to SearchView when the magnifying glass is tapped
                    Button(action: {
                        showSearchView = true
                    }) {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .foregroundColor(.purple)
                            .padding()
                            .frame(width: 60, height: 60)
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CartView().environmentObject(cartManager)) {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                }
            }
            .sheet(isPresented: $showAddItemsView) {
                AddItemsView(productList: $productList)
            }
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showAddItemsView = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .foregroundColor(.purple)
                                .frame(width: 60, height: 60)
                        }
                        .padding()
                    }
                    .padding(.bottom, 20)
                    .background(Color.clear)
                }
                .padding()
            )
        }
        .sheet(isPresented: $showSettingsView) {
            SettingsView()
        }
        .sheet(isPresented: $showSearchView) {
            // Pass the productList and cartManager to the SearchView
            SearchView(productList: $productList)
                .environmentObject(cartManager)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//import SwiftUI
//
//struct ContentView: View {
//
//    @StateObject var cartManager = CartManager()
//
//
//    @State var productList: [Product] = [
//        Product(name: "AirPods", image: UIImage(named: "1"), price: 200, contact: "12345", description:"Bought in 2021, mild wear", category: "Electronic"),
//        Product(name: "Laptop", image: UIImage(named: "2"), price: 900, contact: "12334", description:"Bought in 2020, 13inch MacBook Pro, gray", category: "Electronic")
//    ]
//
//    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
//
//    @State private var showAddItemsView = false
//    @State private var showSettingsView = false
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 20) {
//                    ForEach(productList, id: \.id) { product in
//                        Card(product: product)
//                            .environmentObject(cartManager)
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle(Text("NUS Flea Market"))
//
//            .toolbar {
//
//                ToolbarItem(placement: .navigationBarLeading)  {
//                    Button(action: {
//                        showSettingsView = true
//                    }) {
//                        Image(systemName: "gearshape")
//                            .foregroundColor(.purple)
//                            .padding()
//                            .frame(width: 60, height: 60)
//                    }
//                }
//
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(destination: SearchView()) {
//                        Image(systemName: "magnifyingglass.circle.fill")
//                            .resizable()
//                            .foregroundColor(.purple)
//                            .padding()
//                            .frame(width: 60, height: 60)
//                    }
//                }
//
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(destination: CartView().environmentObject(cartManager)) {
//                        CartButton(numberOfProducts: cartManager.products.count)
//                    }
//                }
//
//
//
//
//            }
//            .sheet(isPresented: $showAddItemsView) {
//                AddItemsView(productList: $productList)
//            }
//            .overlay(
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            showAddItemsView = true
//                        }) {
//                            Image(systemName: "plus.circle.fill")
//                                .resizable()
//                                .foregroundColor(.purple)
//                                .frame(width: 60, height: 60)
//                        }
//                        .padding()
//                    }
//                    .padding(.bottom, 20)
//                    .background(Color.clear)
////                    .overlay(
////                        Button(action: {
////                            showSettingsView = true
////                        }) {
////                            Image(systemName: "gearshape")
////                                .foregroundColor(.purple)
////                                .padding()
////                                .frame(width: 60, height: 60)
////                        }
////                        //.frame(maxWidth: .infinity, alignment: .leading)
////                        , alignment: .bottomLeading
////                    )
//                }
//                .padding()
//            )
//        }
//        .sheet(isPresented: $showSettingsView) {
//            SettingsView()
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//
//
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
