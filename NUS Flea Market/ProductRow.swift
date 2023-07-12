import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    @State private var showItemDetail = false
    
    var body: some View {
        HStack(spacing: 20) {
            
            
            Button {
                showItemDetail = true
                
            } label: {
                HStack{
                if let image = product.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .cornerRadius(10)
                } else {
                    Color.purple
                        .frame(width: 50)
                        .cornerRadius(10)
                }
                
                
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.name)
                            .bold()
                            .foregroundColor(.purple)
                        
                        Text("$\(product.price)")
                            .foregroundColor(.purple)
                    }
                }
            }
            
            
            
            Spacer()

            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .sheet(isPresented: $showItemDetail) {
            itemDetail(product: product)
                .environmentObject(cartManager)
        }
        
    }
    
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productList[2])
            .environmentObject(CartManager())
    }
}
