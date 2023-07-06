//
//  itemDetail.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 6/7/2023.


import SwiftUI

struct itemDetail: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    @State var texts = "Add to Cart"

    var body: some View {

        ZStack{
            ScrollView {
                VStack {
                    
                    
                    if let image = product.image {
                        Image(uiImage: image)
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 350,height:200)
                            .scaledToFit()
                    } else {
                        Color.purple
                            .cornerRadius(20)
                            .frame(width: 350,height:200)

                    }

                    
                    Text(product.name)
                        .fontWeight(.bold)
                        .font(.title2)
                        .frame(width:320,alignment: .leading)
                        .padding()

                    Text("Price")
                        .fontWeight(.bold)
                        .font(.caption)
                        .foregroundColor(.purple)
                        .frame(width:320,alignment: .leading)
                        
                    Text("\(product.price)$")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .frame(width:320,alignment: .leading)
                       

                    Color.white

                    Text("Description")
                        .fontWeight(.bold)
                        .font(.caption)
                        .foregroundColor(.purple)
                        .frame(width:320,alignment: .leading)
                    
                    Text(product.description)
                        .fontWeight(.semibold)
                        .font(.callout)
                        .frame(width:320,alignment: .leading)
                      
                       

                    Color.white
                    
                    Text("Contact Detail")
                        .fontWeight(.bold)
                        .font(.caption)
                        .foregroundColor(.purple)
                        .frame(width:320,alignment: .leading)
                    
                    Text("\(product.contact)")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .frame(width:320,alignment: .leading)
                        

                   



                }.padding()

            }
            VStack{
                Spacer()

                Button {
                    cartManager.addToCart(product: product)
                    texts = "Added to Cart!"
                } label: {
                    Text(texts)
                        .frame(width: 330, height:50)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .background(.purple)
                        .cornerRadius(20)
                        .padding()
                }
            }
        }



    }
}

struct itemDetail_Previews: PreviewProvider {
    static var previews: some View {
       itemDetail(product: productList[0])
            .environmentObject(CartManager())
    }
}
