//
//  TripFunctions.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/11/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class Tripfunctions {
    
    static func createTrip(tripModel: TripModel){
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()){
        DispatchQueue.global(qos: .userInteractive).async {
//            if Data.tripModels.count == 0 {
//                Data.tripModels.append(TripModel(title: "Chile"))
//                Data.tripModels.append(TripModel(title: "Brasil"))
//                Data.tripModels.append(TripModel(title: "Estados Unidos"))
//            }
            
            if Data.tripModels.count == 0 {
                Data.tripModels = MockData.createMockTripModelData()
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    static func readTrip(by id: UUID, completion: @escaping (TripModel?) -> ()){
        DispatchQueue.global(qos: .userInitiated).async {
            let trip = Data.tripModels.first(where: {$0.id == id})
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil){
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    static func deleteTrip(index: Int){
        Data.tripModels.remove(at: index)
    }
    
}
