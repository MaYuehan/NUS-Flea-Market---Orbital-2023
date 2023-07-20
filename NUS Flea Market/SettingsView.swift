//
//  SettingsView.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 10/6/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var userList: [User] = [
        // ... existing user data ...
    ]
    
    @State private var showSP = false
    @State private var showLI = false
    
    //@State private var showSheet = true
    
    @State private var checkSP = false
 
    
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
                    
                                        Button(action:{
                                            //showSheet = true
                                            showSP = true
                                            //presentationMode.wrappedValue.dismiss()
                                            //checkSP = showSheet==true && showSP == true
                                            
                    
                                        }, label: {
                                            Text("Sign Up")
                                                .font(.headline)
                                                .foregroundColor(.purple)
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(20)
                                        }).sheet(isPresented: $showSP) {
                    
                                            SignupPage(showSP:$showSP)
                    
                                        }
                                        .navigationViewStyle(StackNavigationViewStyle())
                                        
                    
                    
//                    NavigationLink("Sign Up",
//                                   destination: SignupPage(showSheet:$showSheet))
//                    .font(.headline)
//                    .foregroundColor(.purple)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(20)
                    
                }
                
                
                
                VStack{
                    Spacer()
                    
                    NavigationLink("Log in",
                                    destination: LoginPage(userList: $userList,showSP:$showSP))
                    .font(.headline)
                    .foregroundColor(.purple)
                    .padding()
                    .frame(width: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    
//                    Button(action:{
//                        showLI = true
//                        //presentationMode.wrappedValue.dismiss()
//
//                    }, label: {
//                        Text("Log in")
//                            .font(.headline)
//                            .foregroundColor(.purple)
//                            .padding()
//                            .frame(width: 300)
//                            .background(Color.white)
//                            .cornerRadius(20)
//                    }).sheet(isPresented: $showLI) {
//
//                        LoginPage(userList: $userList)
//
//                    }
//                    .navigationViewStyle(StackNavigationViewStyle())
//
                }
                
            }
        }
        
            
        }
        
    }


struct SignupPage: View{
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var account: String = ""
    
    @State private var buttonText = "Register"
    
    @State private var showLogin = false
    @State var userList: [User] = [
        // ... existing user data ...
    ]
    
    
    @Binding var showSP: Bool
    
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
                    
                    TextField("Your Email...", text: $account)
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
                            
                    Text(age)
                        
                        Picker(
                        selection: $age,
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
                
                if textAppropriate() {
                    Button(action: {
                        addInfo()
                        buttonText = "Registered!"
                    }) {
                        Text(buttonText)
                            .foregroundColor(.purple)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 350)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)
                    }
                }
                
                
               if textAppropriate() {
                    NavigationLink("Go to Login",
                                   destination: LoginPage(userList: $userList, showSP:$showSP))
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 350)
                    .background(Color.purple)
                    .cornerRadius(20)
                   
//                   Button(action:{
//                       showLogin = true
//                       //presentationMode.wrappedValue.dismiss()
//
//                   }, label: {
//                           Text("Go to Login")
//                           .font(.headline)
//                           .foregroundColor(.white)
//                           .padding()
//                           .frame(width: 350)
//                           .background(Color.purple)
//                           .cornerRadius(20)
//                   }).sheet(isPresented: $showLogin) {
//                       // Pass the productList and cartManager to the SearchView
//                       LoginPage(userList: $userList)
//
//                   }
//                   .navigationViewStyle(StackNavigationViewStyle())
                   
                }
                
                
                
            }
            .navigationTitle(Text("Sign Up").foregroundColor(.purple))
            .accentColor(Color.purple)
            
            
            
            
        }
        
    }
    
    func textAppropriate() -> Bool {
        if name.count >= 3 && account.count >= 3 {
            return true
        }
        return false
    
    }
    
    private func addInfo() {
        
        let newUser = User(name: name, account: account, age: age)
        userList.append(newUser)
        //presentationMode.wrappedValue.dismiss()

    }
        
    
}


struct LoginPage: View{
    
    @Environment(\.presentationMode) var presentationMode
    @State private var names: String = ""
    @State private var ages: String = ""
    @State private var accounts: String = ""
    @State private var buttonColor: Color = Color.purple
    @State private var buttonText: String = "Enter"
    @State private var textColor: Color = Color.white
    
    @State private var showAlert = false
    @State private var showProfile = false
    @Binding var userList: [User]
    
    @Binding var showSP: Bool
    
    var body: some View{
       
        NavigationView{
            VStack{
                Spacer(minLength: .nan)
                
                VStack{
                    Text("UserName")
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                    
                    TextField("Your Name...", text: $names)
                        .padding()
                        .frame(width: 350)
                        .background(Color.purple.opacity(0.3) .cornerRadius (10))
                    
                }
                
                Spacer()
                
                VStack{
                    Text("Account (Email)")
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                    
                    TextField("Your Email...", text: $accounts)
                        .padding()
                        .frame(width: 350)
                        .background(Color.purple.opacity(0.3) .cornerRadius (10))
                }
                
                    VStack{
                        Text("Age")
                            .fontWeight(.semibold)
                            .frame(alignment: .leading)
                        
                        TextField("Your Age...", text: $ages)
                            .padding()
                            .frame(width: 350)
                            .background(Color.purple.opacity(0.3) .cornerRadius (10))
                        
                }
            
                
                Spacer()
                Spacer()
                Spacer()
                
                
                Button(action:{
                    if exitUser.isEmpty {
//                        buttonText = "Account does not exist"
//                        textColor = Color.red
//                        buttonColor = Color.gray.opacity(0.3)
                        showAlert = true
                        
                    }else{
                        showProfile = true
                        //presentationMode.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    Text(buttonText)
                        .font(.headline)
                        .foregroundColor(textColor)
                        .padding()
                        .frame(width: 350)
                        .background(buttonColor)
                        .cornerRadius(20)
                }).alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Account does not exist"))
                })
                    
                
            }
            .navigationTitle(Text("Login").foregroundColor(.purple))
            .accentColor(Color.purple)
            .sheet(isPresented: $showProfile) {
                // Pass the productList and cartManager to the SearchView
                Profile(names:$names, accounts:$accounts, ages:$ages, showSP: $showSP)
                    
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
        
    }
    
    func textAppropriate() -> Bool {
        if names.count >= 3 && accounts.count >= 3 {
            return true
        }
        return false
    
    }
    
  
    
    
    private var exitUser: [User] {
     
        return userList.filter { user in
            let matchName = user.name == names
            let matchAccount = user.account == accounts
            let matchAge = user.age == ages
            return matchName && matchAccount && matchAge
        }
        
    }
    
}

    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
            //SignupPage()
            //LoginPage()
            
        }
    }
