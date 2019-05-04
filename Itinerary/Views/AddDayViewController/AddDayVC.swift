//
//  AddDayVC.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 5/3/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class AddDayVC: UIViewController {

    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfSubTitle: UITextField!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    var doneSaving: (() -> Void)?
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        viewPopup.addShadowAndRoundedCorners()
        //        viewPopup.backgroundColor = Theme.background
        lblTitle.font = UIFont(name: Theme.mainFontName, size: 24)
        
        
        //Dropshadow on title
        lblTitle.layer.shadowOpacity = 1
        lblTitle.layer.shadowColor = UIColor.white.cgColor
        lblTitle.layer.shadowOffset = CGSize.zero
        lblTitle.layer.shadowRadius = 5
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        tfTitle.rightViewMode = .never
        
        guard tfTitle.text != "", let newTripName = tfTitle.text else {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            imageView.image = UIImage(named: "ic_alert_red")
            imageView.contentMode = .scaleAspectFit
            
            tfTitle.rightView = imageView
            
            // Alternatives
            //            tfTrip.backgroundColor = UIColor.red
            //            tfTrip.layer.borderColor = UIColor.red.cgColor
            //            tfTrip.layer.borderWidth = 1
            //            tfTrip.layer.cornerRadius = 5
            
            tfTitle.rightViewMode = .always
            
            return
        }
//
//        if let index = tripIndexToEdit {
//            Tripfunctions.updateTrip(at: index, title: tfTrip.text!, image: ivBackground.image)
//        }else{
//            Tripfunctions.createTrip(tripModel: TripModel(title: newTripName, image: ivBackground.image))
//        }
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true, completion: nil)
    }

}
