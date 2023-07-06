import SwiftUI

struct Card: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    @State private var showItemDetail = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                if let image = product.image {
                    Image(uiImage: image)
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 180)
                        .scaledToFit()
                } else {
                    Color.white
                        .cornerRadius(20)
                        .frame(width: 180)
                }

                Button{
                    showItemDetail = true
                    
                    
                }label: {
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .foregroundColor(Color.white)
                            .bold()

                        Text("\(product.price)$")
                            .foregroundColor(Color.white)
                            .font(.caption)
                    }
                    .padding()
                    .frame(width: 180, alignment: .leading)
                    .background(.purple)
                    .cornerRadius(20)
                }


            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)

            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.purple)
                    .cornerRadius(50)
                    .padding()
            }
        }
        .sheet(isPresented: $showItemDetail) {
            itemDetail(product: product)
                .environmentObject(cartManager)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(product: productList[0])
            .environmentObject(CartManager())
    }
}


