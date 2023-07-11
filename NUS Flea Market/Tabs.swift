//
//  Tabs.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 6/7/2023.
//

import SwiftUI
import Foundation

struct Tabs: View {
    var body: some View {
        
        TabView {
            Text("HOME TAB")
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            
            
            Text("sell")
                .tabItem{
                    Image(systemName: "plus.circle.fill")
                    Text("Sell")
                }
            
            Text("cart")
                .tabItem{
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
            
            
            Text("profile")
                .tabItem{
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Profile")
                }
            
        }
        .accentColor(Color.purple)
        
    }
}



struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
        //CartViews()
    }
}
