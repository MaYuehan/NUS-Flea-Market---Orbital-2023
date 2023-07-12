//
//  Trail.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 6/7/2023.
//

import SwiftUI

struct Trail: View {
    
    @State var selection: String = "Books"
    let categories: [String] = [
    "Books", "Stationery", "Furnitures","Electrical","Clothes","Daily Use", "Other"]
    
    var body: some View {
        
        Picker(
        selection: $selection,
        label: Text ("Picker"),
    content: {
        ForEach (categories, id: \.self) { option in
            Text(option)
                .tag (option)
        }
    }
        )

    }
}

struct Trail_Previews: PreviewProvider {
    static var previews: some View {
        Trail()
    }
}
