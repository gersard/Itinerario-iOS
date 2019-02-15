//
//  UiViewExtension.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/14/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadowAndRoundedCorners(){
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
