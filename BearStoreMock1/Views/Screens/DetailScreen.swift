//
//  DetailScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI
import Resolver

struct DetailScreen: View {
    
    var bear: Bear
    
    @ObservedObject var vm : BearViewModel = Resolver.resolve()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private func buy() {
        
        guard bear.price >= 1 else {return}
        
        vm.buyBear(bear)
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading, spacing: Dm.small){
                // title
                Text(bear.name)
                    .font(.system(size:FontSize.large))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // bear image
                Image("bear")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height:250)
                
                // condition
                Text("Condition")
                    .font(.system(size:FontSize.medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    ForEach(1...bear.condition, id:\.self){ number in
                        Image("bear")
                            .resizable()
                            .frame(width: Dm.large, height: Dm.large)
                    }
                }
                
                // dscription
                Text("Description")
                    .font(.system(size:FontSize.medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(bear.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // buy section
                HStack{
                    Text("\(bear.price.toStringWithDecimal(n: 0)) SOL")
                    RoundedCornerButton(label:"Buy", width: Dm.xxlarge*2){
                        buy()
                    }
                    Spacer()
                }
                .frame(height: Dm.large)
                
                Spacer()
            }
        }
        .padding()
        .navigationBarTitle(bear.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(bear: MockBear)
    }
}
