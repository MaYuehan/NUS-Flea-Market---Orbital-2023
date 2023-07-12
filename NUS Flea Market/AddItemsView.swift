
import SwiftUI
import UIKit

struct AddItemsView: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var productList: [Product]
    
    @State private var name = ""
    @State private var price = ""
    @State private var contact = ""
    @State private var description = ""
    @State private var image: UIImage?
    @State private var showImagePicker = false
    @State private var category: String = ""
    
    
    let categories: [String] = [
    "Book", "Stationery", "Furniture","Electronic","Clothes","Daily Use", "Other"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Details")) {
                    TextField("Name", text: $name)
                    TextField("Price", text: $price)
                    TextField("Contact", text: $contact)
                    TextField("Description", text: $description)
                    
                    
                    Picker(
                    selection: $category,
                    label: HStack{
                        Text ("Category:")
                        Text(category)
                    },
                content: {
                    ForEach (categories, id: \.self) { option in
                        Text(option)
                            .tag (option)
                    }
                }
                    )
                    
                    
                    if let selectedImage = image {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    }
                    
                    Button(action: {
                        showImagePicker = true
                    }) {
                        Text("Choose Image")
                            .foregroundColor(.purple)
                    }
                }
                
                Section {
                    Button(action: {
                        addItem()
                    }) {
                        Text("Add Item")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold)
                            
                    }
                }
            }
            .navigationTitle("Add Item")
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $image)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }
                }
            }
        }
    }
    
    private func addItem() {
        guard let price = Int(price) else {
            // Handle invalid price input
            return
        }

        
        let newItem = Product(name: name, image: image, price: price, contact: contact, description: description, category: category)
        productList.append(newItem)
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(image: $image, presentationMode: presentationMode)
    }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var image: UIImage?
    var presentationMode: Binding<PresentationMode>
    
    init(image: Binding<UIImage?>, presentationMode: Binding<PresentationMode>) {
        _image = image
        self.presentationMode = presentationMode
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = selectedImage
        }
        
        presentationMode.wrappedValue.dismiss()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        presentationMode.wrappedValue.dismiss()
    }
}







