import Foundation
import UIKit

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: UIImage?
    var price: Int
    var contact: String
    var description: String
    var category: String
//
}

var productList = [
    Product(name: "AirPods", image: UIImage(named: "1")!, price: 54, contact: "123456", description:"Bought in 2021, mild wear", category: "Electrical"),
    Product(name: "Laptop", image: UIImage(named: "2")!, price: 83, contact: "133245", description:"Bought in 2020, 13inch MacBook Pro, gray", category: "Electrical")

]



