//
//  SettingsView.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 10/6/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
   
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.purple.ignoresSafeArea()
                
                
                VStack(alignment:.leading) {
                    Text("NUS")
                        .foregroundColor(.white)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .bold()
                    
                    Text("FLEA MARKET")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .bold()
                    
                    //                Button(action:{
                    //
                    //                }, label: {
//                                        Text("Sign up")
//                                            .font(.headline)
//                                            .foregroundColor(.purple)
//                                            .padding()
//                                            .background(Color.white)
//                                            .cornerRadius(20)
                    //                })
                    
                    NavigationLink("Sign Up",
                                    destination: SignupPage())
                    .font(.headline)
                    .foregroundColor(.purple)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    
                }
                
                
                VStack{
                    Spacer()
                    
                    NavigationLink("Log in",
                                    destination: LoginPage())
                    .font(.headline)
                    .foregroundColor(.purple)
                    .padding()
                    .frame(width: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                }
            }
            
            
        }
        
    }
}


struct SignupPage: View{
    
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var selection: String = ""
    @State var Email: String = ""
    
    
    var body: some View{
       
        NavigationView{
            VStack{
                Spacer(minLength: .nan)
                
                VStack{
                    Text("UserName")
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                    
                    TextField("Your Name...", text: $name)
                        .padding()
                        .frame(width: 350)
                        .background(Color.purple.opacity(0.3) .cornerRadius (10))
                }
                
                Spacer()
                
            
                VStack{
                    Text("Email")
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                    
                    TextField("Your Email...", text: $Email)
                        .padding()
                        .frame(width: 350)
                        .background(Color.purple.opacity(0.3) .cornerRadius (10))
                }
                
                Spacer()
            
                
                
                VStack{
                    Text("Age")
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                    
                    HStack{
                            
                    Text(selection)
                        
                        Picker(
                        selection: $selection,
                        label: Text ("Picker"),
                    content: {
                        ForEach (15..<80) { number in
                            Text("\(number)" )
                                .tag ("\(number)")
                        }
                    }
                        )
                        
                        
                    }
                    .frame(width:350)
                    .background(Color.purple.opacity(0.3)
                        .cornerRadius (10))
                }
                
                
                
                Spacer()
                
                Spacer()
                
                Spacer()
                
                
                if textAppropriate() {
                    NavigationLink("Go to Login",
                                   destination: LoginPage())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 350)
                    .background(Color.purple)
                    .cornerRadius(20)
                }
                
                
                    
                
            }
            .navigationTitle(Text("Sign Up").foregroundColor(.purple))
            .accentColor(Color.purple)
            
            
            
            
        }
        
    }
    
    func textAppropriate() -> Bool {
        if name.count >= 3 && Email.count >= 3 {
            return true
        }
        return false
    
    }
        
    
}


struct LoginPage: View{
    
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var Email: String = ""
   //@State var currentName: String?
    
    var body: some View{
       
        NavigationView{
            VStack{
                Spacer(minLength: .nan)
                
                VStack{
                    Text("UserName")
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                    
                    TextField("Your Name...", text: $name)
                        .padding()
                        .frame(width: 350)
                        .background(Color.purple.opacity(0.3) .cornerRadius (10))
                    
                }
                
                Spacer()
                
                VStack{
                    Text("Account (Email)")
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                    
                    TextField("Your Email...", text: $Email)
                        .padding()
                        .frame(width: 350)
                        .background(Color.purple.opacity(0.3) .cornerRadius (10))
                    
                }
            
                
                Spacer()
                Spacer()
                Spacer()
                
                Button(action:{
                    if textAppropriate() {
//                        UserDefaults.standard.set(name, forKey: "Name")
//                        UserDefaults.standard.set(Email, forKey: "Email")
                    }
                    
                }, label: {
                    Text("Save my Info")
                        .font(.headline)
                        .foregroundColor(.purple)
                        .padding()
                        .frame(width: 350)
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(20)
                })
                .onAppear{
//                    name = UserDefaults.standard.string(forKey: "Name")
//                    Email = UserDefaults.standard.string(forKey: "Email")
                }
                
                Button(action:{
                    if textAppropriate() {
                        saveText()
                    }
                    
                }, label: {
                    Text("Enter")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 350)
                        .background(Color.purple)
                        .cornerRadius(20)
                })
                    
                
            }
            .navigationTitle(Text("Login").foregroundColor(.purple))
            .accentColor(Color.purple)
            
        }
        
    }
    
    func textAppropriate() -> Bool {
        if name.count >= 3 && Email.count >= 3 {
            return true
        }
        return false
    
    }
    
    func saveText() {
        
    }
        
    
}



    
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
            //SignupPage()
            //LoginPage()
            
        }
    }
