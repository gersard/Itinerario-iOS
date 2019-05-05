//
//  DayModel.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/23/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import Foundation
struct DayModel {
    var id: String!
    var title = Date()
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: Date, subtitle: String, data: [ActivityModel]?) {
        self.id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        if let data = data {
            self.activityModels = data
        }
    }
}
