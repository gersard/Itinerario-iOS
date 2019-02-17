//
//  PopupUiView.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/16/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class PopupUiView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        
        backgroundColor = Theme.background
    }

}
