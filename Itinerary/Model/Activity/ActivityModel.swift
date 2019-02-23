//
//  ActivityModel.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/23/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

struct ActivityModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title: String, subTitle: String, activityType: ActivityType, photo: UIImage? = nil) {
        self.id = UUID().uuidString
        self.title = title
        self.subtitle = subTitle
        self.activityType = activityType
        self.photo = photo
    }
}
