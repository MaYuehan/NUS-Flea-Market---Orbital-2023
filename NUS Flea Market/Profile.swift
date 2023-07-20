//
//  Profile.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 20/7/2023.
//

import SwiftUI
import UIKit

struct Profile: View {
    @State private var image: UIImage?
    @State private var showImagePicker = false
    @Binding var names: String
    @Binding var accounts: String
    @Binding var ages: String
    
    var body: some View {
        VStack{
           
            
            
            if let selectedImage = image {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(180)
                    .frame(width: 180,height:180)
            } else{
                Color.purple
                    .cornerRadius(180)
                    .frame(width: 180,height:180)
            }
            
            
            Button(action: {
                showImagePicker = true
            }) {
                Text("Change photo")
                    .foregroundColor(.gray)
                
            }
            
         
            
            Text(names)
                .fontWeight(.bold)
                .font(.title)
            
            Text(accounts)
                .fontWeight(.semibold)
                .font(.title3)
                .foregroundColor(.purple)
            
          
            
        }
        .sheet(isPresented: $showImagePicker) {
        ImagePicker(image: $image)
    }
        
    }
        
}






//struct Profile_Previews: PreviewProvider {
//    static var previews: some View {
//        Profile(names:$names, accounts:$accounts, ages:$ages)
//    }
//}
