//
//  SearchView.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 6/7/2023.
//

import SwiftUI

struct SearchView: View {
    
    @State var keyword: String = ""
    
    var body: some View {
        
        ZStack{
            
            //cards
            VStack {
                Color.white.frame(height: 100)
            
                ScrollView{
                    
                    NavigationLink{
                             CategoryBooks()
                    }label:{
                        Text("Books")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }
                    .padding()
                    
                    
                    NavigationLink{
                             CategoryStationery()
                    }label:{
                        Text("Stationeries")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }
                    .padding()
                    
                    
                    NavigationLink{
                             CategoryFurnitures()
                    }label:{
                        Text("Furnitures")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }
                    .padding()

                   
                    
                    NavigationLink{
                             CategoryElectrical()
                    }label:{
                        Text("Electronics")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }
                    .padding()
                    
                    
                    NavigationLink{
                             CategoryClothes()
                    }label:{
                        Text("Clothes")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }
                    .padding()
                   
                    NavigationLink{
                             CategoryDailyUse()
                    }label:{
                        Text("Daily use")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }
                    .padding()
                   
                    
                    
                    NavigationLink{
                             CategoryOther()
                    }label:{
                        Text("Other")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }
                    .padding()
                
                    
                }
                  
              }
            
            //search bar
            VStack {
                ZStack {
                    Color.white.frame(height: 100)
                    HStack {
                        
                        TextField("What are you looking for?", text: $keyword)
                            .padding()
                            .frame(height:50)
                            .background(Color.purple.opacity(0.3)
                                .cornerRadius (10))
                            .padding()
                        
                        
                        Button {
                           //action
                        } label: {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .resizable()
                                .foregroundColor(.purple)
                                .frame(width: 35, height: 35)
                                .padding()
                        }
                    }
                }
                
                Spacer()
                
            }
            
            
          
            
        }
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
