//
//  HeaderTVCell.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 4/25/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class HeaderTVCell: UITableViewCell {
        
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblTitle.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
        lblSubtitle.font = UIFont(name: Theme.bodyFontName, size: 15)
    }
    
    func setup(day: DayModel){
        lblTitle.text = day.title
        lblSubtitle.text = day.subtitle
    }

}
