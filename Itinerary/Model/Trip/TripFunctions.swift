//
//  TripFunctions.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/11/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import Foundation
class Tripfunctions {
    
    static func createTrip(tripModel: TripModel){
        
    }
    
    static func readTrips(){
        if Data.tripModels.count == 0 {
            Data.tripModels.append(TripModel(title: "Chile"))
            Data.tripModels.append(TripModel(title: "Brasil"))
            Data.tripModels.append(TripModel(title: "Estados Unidos"))
        }
    }
    
    static func updateTrip(tripModel: TripModel){
        
    }
    
    static func deleteTrip(id: String){
        
    }
    
}
