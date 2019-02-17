//
//  TripModel.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/11/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class TripModel {
    var id: UUID
    var title: String!
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil) {
        id = UUID()
        self.title = title
        self.image = image
    }
}
