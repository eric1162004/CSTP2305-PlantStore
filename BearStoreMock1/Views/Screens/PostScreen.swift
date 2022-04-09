//
//  PostScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI
import Resolver

struct PostScreen: View {
    
    @ObservedObject var vm : PlantViewModel = Resolver.resolve()
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var selectedImage: UIImage?
    @State private var showImagePicker: Bool = false
    
    @State var errorMsg : String?
    
    private func post() {
        
        errorMsg = nil
        
        // validate
        guard selectedImage != nil else {
            errorMsg = "Must select a picture."
            return
        }
        
        guard !name.isEmpty && !description.isEmpty else {
            errorMsg = "Fields cannot be empty."
            return
        }
        
        // add
        vm.add(
            Plant(
            name: name,
            description: description),
            selectedImage
        )
        
        resetFields()
    }
    
    private func resetFields() {
        name = ""
        description = ""
        selectedImage = nil
    }
    
    var body: some View {
            ScrollView() {
                
                // title
                AppTitleBar(title: "ADD\nPLANTS", showUserImage: true)
                
                // image picker
                if let selectedImage = selectedImage {
                    AppImageView(uiImage: selectedImage)
                        .frame(width: 180, height: 180)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: CornerRadius.medium))
                } else {
                    ImageSelectField(){
                        showImagePicker.toggle()
                    }
                }
                
                // name
                InputField(text:$name, placeHolder: "NAME")
                    .padding(.horizontal, Dm.medium)
                
                // descriptione
                InputField(text: $description, placeHolder: "DESCRIPTION", height: Dm.xxlarge * 3)
                    .padding(.horizontal, Dm.medium)
                
                // error message
                if let errorMsg = errorMsg {
                    AppText(text: errorMsg, fontColor: Color.appRed, isBold: true)
                }
                
                // Add post button
                AppCapsuleButton(label:"ADD"){
                    post()
                }
                .padding(.vertical, Dm.small)
                
                Spacer()
            }
            .onTapGesture {
                hideKeyboard()
            }
            .sheet(isPresented: $showImagePicker ){
                PhotoPicker(image: $selectedImage)
            }
    }
    
}

struct PostScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostScreen()
    }
}
