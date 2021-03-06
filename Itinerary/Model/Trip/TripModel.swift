//
//  TripModel.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/11/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

struct TripModel {
    var id: UUID
    var title: String!
    var image: UIImage?
    var dayModels = [DayModel]() {
        didSet{
            // Llamado cuando un nuevo valor es asignado a dayModels
//            dayModels = dayModels.sorted(by: { (dayModel1, dayModel2) -> Bool in
//                dayModel1.title < dayModel2.title
//            })
//            dayModels = dayModels.sorted(by: { $0.title < $1.title })
            dayModels = dayModels.sorted(by: <)
        }
    }
    
    init(title: String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        if let dayModels = dayModels{
            self.dayModels = dayModels
        }
    }
}
