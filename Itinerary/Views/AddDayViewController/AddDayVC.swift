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
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tfSubTitle: UITextField!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    var doneSaving: ((DayModel) -> Void)?
    var tripIndex: Int?
    
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
//        tfTitle.rightViewMode = .never
        
//        guard tfTitle.hasValue, let newTitle = tfTitle.text else { return }

        let dayModel = DayModel(title: datePicker.date, subtitle: tfSubTitle.text ?? "", data: nil)
        DayFunctions.createDay(at: tripIndex!, dayModel: dayModel)
        
        if let doneSaving = doneSaving {
            doneSaving(dayModel)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func donePressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    

}
