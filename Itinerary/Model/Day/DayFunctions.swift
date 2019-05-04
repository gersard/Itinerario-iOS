//
//  DayFunctions.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 5/4/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import Foundation
class DayFunctions{
    static func createDay(at tripIndex: Int, dayModel: DayModel){
        Data.tripModels[tripIndex].dayModels.append(dayModel)
    }
}
