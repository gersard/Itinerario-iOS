//
//  UIButtonExtension.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/14/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

extension UIButton {

    func styleToFloatingActionButton(){
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 6)
    }

}
