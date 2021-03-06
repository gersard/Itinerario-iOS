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

//extension DayModel: Equatable{
//    static func == (lhs: DayModel, rhs: DayModel) -> Bool {
//        return lhs.id == rhs.id
//    }
//}

extension DayModel: Comparable{
    static func < (lhs: DayModel, rhs: DayModel) -> Bool {
        return lhs.title < rhs.title
    }
    
    static func == (lhs: DayModel, rhs: DayModel) -> Bool {
        return lhs.id == rhs.id

    }
    
}
