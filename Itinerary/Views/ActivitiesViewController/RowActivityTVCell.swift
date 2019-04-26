//
//  RowActivityTVCell.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 4/25/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class RowActivityTVCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var ivTypeActivity: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndRoundedCorners()
        lblTitle.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 17)
        lblSubtitle.font = UIFont(name: Theme.bodyFontName, size: 17)
    }
    
    func setup(activity: ActivityModel){
        lblTitle.text = activity.title
        lblSubtitle.text = activity.subtitle
        ivTypeActivity.image = getActivityImage(type: activity.activityType)
    }
    
    func getActivityImage(type: ActivityType) -> UIImage{
        var image: UIImage?
        switch type {
        case .auto:
            image = #imageLiteral(resourceName: "Car")
        case .excursion:
            image = #imageLiteral(resourceName: "Excursion")
        case .flight:
            image = #imageLiteral(resourceName: "Flight")
        case .food:
            image = #imageLiteral(resourceName: "Food")
        case .hotel:
            image = #imageLiteral(resourceName: "Hotel")
        }
        return image!
    }
    

}
