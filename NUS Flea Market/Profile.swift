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
    @Binding var showSP: Bool
    @Binding var showSettingsView: Bool
    
    var body: some View {
        ZStack{
            VStack{
                
                
                
                if let selectedImage = image {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(200)
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
        
        VStack{
            Spacer()
            
            Button(action: {
                showSP = false
                showSettingsView = false
                
                //SettingsView().presentationMode.wrappedValue.dismiss()
                
                
                
            }) {
                Text("Done")
                    .foregroundColor(.purple)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(width: 350)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
            }
        }
        
        
        
        
        
    }
        
}






//struct Profile_Previews: PreviewProvider {
//    static var previews: some View {
//        Profile(names:$names, accounts:$accounts, ages:$ages)
//    }
//}
