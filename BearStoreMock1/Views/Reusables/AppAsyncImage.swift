//
//  AppAsyncImage.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-08.
//

import SwiftUI

struct AppAsyncImage: View {
    
    let imageUrl: String
    var width: CGFloat = 200
    var height: CGFloat = 200
    var cornerRadius: CGFloat = 0
    
    var body: some View {
        AsyncImage(
            url: URL(string: imageUrl),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: width, maxHeight: width)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}

struct AppAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AppAsyncImage(imageUrl: "https://www.roboticstoday.com/uploads/images/robots/robotpictures-all/icat-001.jpg")
    }
}
