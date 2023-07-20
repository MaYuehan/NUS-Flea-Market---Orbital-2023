//
//  User.swift
//  NUS Flea Market
//
//  Created by Yuehan Ma on 20/7/2023.
//

import Foundation
import UIKit

struct User: Identifiable {
    var id = UUID()
    var name: String
    //var image: UIImage?
    var account: String
    var age: String
}

var userList = [
    User(name: "Amy", account:"amy@gmail.com", age: "19"),
    User(name: "Henry", account:"Henry@gmail.com", age: "20")

]

