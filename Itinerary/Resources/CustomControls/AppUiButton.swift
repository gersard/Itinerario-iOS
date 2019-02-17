//
//  AppUiButton.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/16/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class AppUiButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Theme.tint
        layer.cornerRadius = 16
        setTitleColor(UIColor.white, for: .normal)
    }

}
