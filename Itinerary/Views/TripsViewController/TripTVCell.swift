//
//  TripTVCell.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/11/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class TripTVCell: UITableViewCell {

    @IBOutlet weak var ivBackground: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.addShadowAndRoundedCorners()
        title.font = UIFont(name: Theme.mainFontName, size: 32)
        bgView.backgroundColor = Theme.accent
        ivBackground.layer.cornerRadius = bgView.layer.cornerRadius
    }
    
    func setup(tripModel: TripModel){
        self.title.text = tripModel.title
        self.ivBackground.image = tripModel.image
    }

}
