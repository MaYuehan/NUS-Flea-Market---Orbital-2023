//
//  Trail.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 6/7/2023.
//

import SwiftUI

struct Trail: View {
    
    @State var col = Color.red
    var body: some View {
        
        
        Button{
            col = Color.white
            
        }label: {
            VStack(alignment: .leading) {
                Text("name")
                    .foregroundColor(col)
                    .bold()

                Text("price")
                    .foregroundColor(col)
                    .font(.caption)
            }
            .padding()
            .frame(width: 180, alignment: .leading)
            .background(.purple)
            .cornerRadius(20)
        }
        
        
    }
}

struct Trail_Previews: PreviewProvider {
    static var previews: some View {
        Trail()
    }
}
