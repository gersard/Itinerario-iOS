//
//  AddTripVC.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/16/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class AddTripVC: UIViewController {

    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tfTrip: UITextField!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    var doneSaving: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewPopup.addShadowAndRoundedCorners()
//        viewPopup.backgroundColor = Theme.background
        lblTitle.font = UIFont(name: Theme.mainFontName, size: 24)
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        tfTrip.rightViewMode = .never
        
        guard tfTrip.text != "", let newTripName = tfTrip.text else {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            imageView.image = UIImage(named: "ic_alert_red")
            imageView.contentMode = .scaleAspectFit

            tfTrip.rightView = imageView
            
            // Alternatives
//            tfTrip.backgroundColor = UIColor.red
//            tfTrip.layer.borderColor = UIColor.red.cgColor
//            tfTrip.layer.borderWidth = 1
//            tfTrip.layer.cornerRadius = 5
            
            tfTrip.rightViewMode = .always
        
            return
        }
        Tripfunctions.createTrip(tripModel: TripModel(title: newTripName))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true, completion: nil)
    }
}
