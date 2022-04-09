//
//  BearViewModel.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import Foundation
import Combine
import Resolver

class BearViewModel: ObservableObject {
    
    @Published var bearRepo: FirestoreRepository<Bear> = Resolver.resolve()
    
    @Published var bears: [Bear] = [Bear]()
    
    private var bearsCopy: [Bear] = [Bear]()
    
    // Store canacllables
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        bearRepo.$items
            .assign(to: \.bears, on: self)
            .store(in: &cancellables)
        
        // keep a copy
        bearRepo.$items
            .assign(to: \.bearsCopy, on: self)
            .store(in: &cancellables)
    }
    
    func search(_ searchTerm: String) {
        
        if(searchTerm.isEmpty){
            bears = bearsCopy
            return
        }
        
        bears = bearsCopy.filter{
            $0.name.lowercased().contains(searchTerm.lowercased())
        }
    }
    
    func add(_ bear: Bear){
        // save to repo
        bearRepo.add(bear)
    }
    
    func buyBear(_ bear: Bear){
        
        var updateBear = bear
        
        updateBear.price -= 1
        
        // save to repo
        bearRepo.update(updateBear)
    }

    
}
