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
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: String, subtitle: String, data: [ActivityModel]?) {
        self.id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        if let data = data {
            self.activityModels = data
        }
    }
}
