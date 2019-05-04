//
//  UIViewControllerExtension.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 5/3/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit
extension UIViewController {
    
    /**
     Just returns the initial view controller on a storyboard
     */
    static func getInstance() -> UIViewController {
        let sb = UIStoryboard(name: String(describing: self), bundle: nil)
        return sb.instantiateInitialViewController()!
    }
}
