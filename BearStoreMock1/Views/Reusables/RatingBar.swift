//
//  RatingBar.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI

struct RatingBar: View {

    @Binding var rating: Int
    
    var title = ""
    var maximumRating = 5
    
    var offImage: Image = Image("bear")
    var onImage: Image = Image("bear")
    
    var height: CGFloat = Dm.xxlarge
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage
        } else {
            return onImage
        }
    }
    
    var body: some View {
        VStack{
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                ForEach(1...maximumRating, id:\.self){ number in
                    image(for: number)
                        .resizable()
                        .opacity(number > rating ? 0.5 : 1.0)
                        .frame(width: Dm.large, height: Dm.large)
                        .onTapGesture {
                            rating = number
                        }
                }
            }
            .padding()
            .frame(maxWidth:.infinity, maxHeight: height, alignment: .leading)
        }
    }
}

struct RatingBar_Previews: PreviewProvider {
    static var previews: some View {
        RatingBar(rating: .constant(4), title:"Condition")
    }
}
