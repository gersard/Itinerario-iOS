//
//  DateExtension.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 5/4/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import Foundation
extension Date{
    func add(days: Int) -> Date{
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
}
