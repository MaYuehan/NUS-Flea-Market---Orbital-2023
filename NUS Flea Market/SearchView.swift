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
                    
                    
                    Button{
                        //action
                    }label: {
                        Text("Books")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }.padding()
                    
                    
                    Button{
                        //action
                    }label: {
                        Text("Stationery")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }.padding()
                    
                    
                    Button{
                        //action
                    }label: {
                        Text("Furnitures")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }.padding()
                    
                    
                    Button{
                        //action
                    }label: {
                        Text("Electrical")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }.padding()
                    
                    
                    Button{
                        //action
                    }label: {
                        Text("Daily use")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }.padding()
                    
                    
                    Button{
                        //action
                    }label: {
                        Text("Other")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }.padding()
                    
                    
                    
                    
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
