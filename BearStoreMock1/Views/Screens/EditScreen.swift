//
//  EditScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import SwiftUI
import Resolver

struct EditScreen: View {
    
    @ObservedObject var vm : PlantViewModel = Resolver.resolve()
    
    let plant: Plant

    @State private var name: String = ""
    @State private var description: String = ""
    @State private var imageUrl: String = ""
    
    @State private var selectedImage: UIImage?
    @State private var showImagePicker: Bool = false
        
    @State var errorMsg : String?
    
    // allow us to pop the current view off the navigation stack
    @Environment(\.presentationMode) var presentation
    
    private func populateFields() {
        name = plant.name
        description = plant.description
        
        if !plant.imageUrl.isEmpty {
            imageUrl = plant.imageUrl
        }
    }
    
    private func post() {
        
        // validate
        guard !name.isEmpty && !description.isEmpty else {
            errorMsg = "Fields cannot be empty."
            return
        }
        
        var updatePlant = plant
        updatePlant.name = name
        updatePlant.description = description
        
        // update
        vm.update(
            updatePlant,
            selectedImage
        )
        
        presentation.wrappedValue.dismiss()
    }
    
    private func delete() {
        vm.remove(plant)
        presentation.wrappedValue.dismiss()
    }

    var body: some View {
        ScrollView() {
                // title
                AppTitleBar(title: "EDIT\nPLANTS", showUserImage: true)
                
                // image picker
                if let selectedImage = selectedImage {
                    AppImageView(uiImage: selectedImage)
                        .frame(maxWidth: 200, maxHeight: 200)
                        .onTapGesture {
                            showImagePicker.toggle()
                        }
                }
                else{
                    if !imageUrl.isEmpty {
                        AppAsyncImage(imageUrl: imageUrl, width:200)
                            .clipShape(Circle())
                            .onTapGesture {
                                showImagePicker.toggle()
                            }
                    }
                    else {
                        ImageSelectField(width:200, height: 200){
                            showImagePicker.toggle()
                        }
                    }
                }
                
                // name
                InputField(text:$name, title: "NAME", backgroundColor: Color.white)
                    .padding(.horizontal, Dm.medium)
                
                // description
                InputField(text: $description, title: "DESCRIPTION", backgroundColor: Color.white)
                    .padding(.horizontal, Dm.medium)
                
                AppCapsuleButton(label:"DONE"){
                    post()
                }
                .padding(.vertical, Dm.small)
            
                AppCapsuleButton(label:"Delete", backgroundColor: Color.appRed){
                    delete()
                }
                
                Spacer()
            }
            .onAppear(perform: {
                populateFields()
            })
            .sheet(isPresented: $showImagePicker ){
                PhotoPicker(image: $selectedImage)
            }
            .ignoresSafeArea()
            .padding()
            .background(Color.backgroundColor)
            .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct EditScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditScreen(plant: MockPlant)
    }
}
