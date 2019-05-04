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
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        tfTitle.rightViewMode = .never
        
        guard tfTitle.hasValue, let _ = tfTitle.text else { return }

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
