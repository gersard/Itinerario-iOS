//
//  UITextFieldExtension.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 5/3/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit
extension UITextField{
    var hasValue: Bool{
        guard text == "" else { return true }

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.image = UIImage(named: "ic_alert_red")
        imageView.contentMode = .scaleAspectFit
        rightView = imageView
        rightViewMode = .unlessEditing
        return false
    }
}
