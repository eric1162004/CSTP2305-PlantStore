//
//  PlantViewPlant.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import Foundation
import Combine
import Resolver
import UIKit

class PlantViewModel: ObservableObject {
    
    private let plantRepo: FirestoreRepository<Plant> = Resolver.resolve()
    private let imageStorageService: ImageStorageService = Resolver.resolve()
    private let authService: AuthService = Resolver.resolve()
    
    @Published var plants: [Plant] = [Plant]()
    @Published var myPlants: [Plant] = [Plant]()
    
    private var plantsCopy: [Plant] = [Plant]()
    private var myPlantsCopy: [Plant] = [Plant]()
    
    // Store canacllables
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // all plants
        plantRepo.$items
            .assign(to: \.plants, on: self)
            .store(in: &cancellables)
        
        // keep a copy
        plantRepo.$items
            .assign(to: \.plantsCopy, on: self)
            .store(in: &cancellables)
        
        // my plants
        plantRepo.$items
            .map { [weak self] plants -> [Plant] in
                plants.filter{ $0.userId == self?.authService.user?.uid}
            }
            .assign(to: \.myPlants, on: self)
            .store(in: &cancellables)
        
        // my plants
        plantRepo.$items
            .map { [weak self] plants -> [Plant] in
                plants.filter{ $0.userId == self?.authService.user?.uid}
            }
            .assign(to: \.myPlantsCopy, on: self)
            .store(in: &cancellables)
    }
    
    func search(_ searchTerm: String) {
        
        if(searchTerm.isEmpty){
            plants = plantsCopy
            return
        }
        
        plants = plantsCopy.filter{
            $0.name.lowercased().contains(searchTerm.lowercased())
        }
    }
    
    func searchMyPlants(_ searchTerm: String) {
        
        if(searchTerm.isEmpty){
            myPlants = myPlantsCopy
            return
        }
        
        myPlants = myPlantsCopy.filter{
            $0.name.lowercased().contains(searchTerm.lowercased())
        }
    }
    
    func add(_ plant: Plant, _ image: UIImage?){
        
        if let image = image {
            var newPlant = plant
            // upload item with image provided
           imageStorageService.upload(image: image) { [weak self] result in
               if case .success(let (uuid, downloadUrl)) = result {
                   newPlant.imageUrl = downloadUrl
                   newPlant.imageUUID = uuid
                   self?.plantRepo.add(newPlant)
               }
           }
        }
        else {
            // save to repo without image
            plantRepo.add(plant)
        }
        
    }
    
    func update(_ plant: Plant, _ image: UIImage?){
        
        // check if user has change item image
        if let image = image {
            
            // delete old image
            if !plant.imageUUID.isEmpty {
                imageStorageService.delete(uuid: plant.imageUUID)
            }
            
            var newPlant = plant
            
            // upload item with new image provided
           imageStorageService.upload(image: image) { [weak self] result in
               if case .success(let (uuid, downloadUrl)) = result {
                   newPlant.imageUrl = downloadUrl
                   newPlant.imageUUID = uuid
                   self?.plantRepo.update(newPlant)
               }
           }
            
        }
        else {
            // image hasn't change, just update fields
            plantRepo.update(plant)
        }
    }
    
    func remove(_ plant: Plant){
        
        let uuid = plant.imageUUID
        
        if !uuid.isEmpty {
            imageStorageService.delete(uuid: uuid)
        }
        
        plantRepo.remove(plant)
        
    }
    
}
