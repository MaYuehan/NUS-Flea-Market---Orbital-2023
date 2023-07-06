import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
       
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) {
                    product in
                    ProductRow(product: product)
                }
            } else {
                Text("EMPTY")
                    .foregroundColor(Color.purple)
                    .fontWeight(.heavy)
            }
          
            HStack {
                Text("Total is ")
                    .fontWeight(.heavy)
                   
                Spacer()
                Text("$\(cartManager.total).00")
                    .fontWeight(.heavy)
                   
            }
            
            .padding()
        }
        .navigationTitle("Cart")
        //.foregroundColor(.purple)
        .padding(.top)
        
    }
        
        
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}



