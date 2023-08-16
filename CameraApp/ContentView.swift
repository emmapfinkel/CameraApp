//
//  ContentView.swift
//  CameraApp
//
//  Created by scholar on 5/26/23.
//

import SwiftUI

struct ContentView: View {
    @State var isImagePickerShowing = false
    @State var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary

    
    var body: some View {
        VStack {
            
            Image(uiImage: selectedImage ?? UIImage(named: "pink-camera")!)
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.accentColor)

            
            Text("Camera picking")
            HStack {
                Button("Select a Photo") {
                                    self.sourceType = .photoLibrary
                                    isImagePickerShowing = true
                                    
                }
                Button("Take a Photo") {
                                    self.sourceType = .camera
                                    isImagePickerShowing = true

                }
            }
        }
        .sheet(isPresented: $isImagePickerShowing) {
                    ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
                }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
