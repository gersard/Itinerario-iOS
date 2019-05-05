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
    
//    func mediumDate() -> String{
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        return formatter.string(from: self)
//    }
    
    var mediumDateStyle: String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
