//
//  AddTripVC.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/16/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit
import Photos

class AddTripVC: UIViewController {

    @IBOutlet weak var ivBackground: UIImageView!
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tfTrip: UITextField!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCamera: UIButton!
    
    var doneSaving: (() -> Void)?
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewPopup.addShadowAndRoundedCorners()
//        viewPopup.backgroundColor = Theme.background
        lblTitle.font = UIFont(name: Theme.mainFontName, size: 24)
        ivBackground.layer.cornerRadius = 10
        
        //Dropshadow on title
        lblTitle.layer.shadowOpacity = 1
        lblTitle.layer.shadowColor = UIColor.white.cgColor
        lblTitle.layer.shadowOffset = CGSize.zero
        lblTitle.layer.shadowRadius = 5
        
        if let index = tripIndexToEdit{
            let trip = Data.tripModels[index]
            tfTrip.text = trip.title
            ivBackground.image = trip.image
        }
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

        if let index = tripIndexToEdit {
            Tripfunctions.updateTrip(at: index, title: tfTrip.text!, image: ivBackground.image)
        }else{
            Tripfunctions.createTrip(tripModel: TripModel(title: newTripName, image: ivBackground.image))
        }

        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true, completion: nil)
    }
    fileprivate func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status{
                case .authorized:
                    self.presentPhotoPickerController()
                    break
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized{
                        self.presentPhotoPickerController()
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Biblioteca de fotos restringida", message: "La biblioteca de fotos está restringida y no se puede acceder a ella.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                case .denied:
                    let alert = UIAlertController(title: "Biblioteca de fotos denegada", message: "La biblioteca de fotos fue denegada, por favor ve a los ajustes para permitir el acceso.", preferredStyle: .alert)
                    let ajustesAction = UIAlertAction(title: "Ir a ajustes", style: .default) {
                        (action) in
                        DispatchQueue.main.async {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                    }
                    alert.addAction(ajustesAction)
                    alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
extension AddTripVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            self.ivBackground.image = image
            self.ivBackground.contentMode = .scaleAspectFill
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
