//
//  TripsVC.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/11/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class TripsVC: UIViewController {

    @IBOutlet weak var tvTrip: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet var helpView: UIVisualEffectView!
    
    var tripIndexToEdit: Int?
    let keySeenHelpView = "seenHelpview"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Theme.background
        btnAdd.styleToFloatingActionButton()
        
        self.tvTrip.dataSource = self
        self.tvTrip.delegate = self
        
        Tripfunctions.readTrips {[unowned self] in
            self.tvTrip.reloadData()
            
            if Data.tripModels.count > 0 {
                if UserDefaults.standard.bool(forKey: self.keySeenHelpView) == false{
                    self.view.addSubview(self.helpView)
                    self.helpView.frame = self.view.bounds
                    
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue"{
            let addTripVc = segue.destination as? AddTripVC
            addTripVc?.tripIndexToEdit = tripIndexToEdit
            addTripVc?.doneSaving = {[weak self] in
                self?.tvTrip.reloadData()
            }
            tripIndexToEdit = nil
        }
    }
    
    @IBAction func btnAddPressed(_ sender: Any) {
    }
    
    @IBAction func closeHelpView(_ sender: Any) {
        UIView.animate(withDuration: 0.6, animations: {
            self.helpView.alpha = 0
        }){ (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.keySeenHelpView)
        }
    }
}

extension TripsVC : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TripTVCell.identifier) as! TripTVCell
        
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let trip = Data.tripModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Eliminar") { (contextualAction, view, actionPerormed: @escaping (Bool) -> ()) in
            
            let alert = UIAlertController(title: "Eliminar Trip", message: "¿Quieres eliminar \(trip.title!)?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (alertAction) in
                actionPerormed(false)
            }))
            alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: { (alertAction) in
                Tripfunctions.deleteTrip(index: indexPath.row)
                self.tvTrip.deleteRows(at: [indexPath], with: .automatic)
                actionPerormed(true)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        delete.image = UIImage(named: "ic_delete")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Editar") { (contextualAction, view, actionPerformed: (Bool) -> ()) in
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        
        edit.backgroundColor = UIColor(named: "Edit")
        
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = Data.tripModels[indexPath.row]
        let storyboard = UIStoryboard(name: String(describing: ActivitiesVC.self), bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ActivitiesVC
        vc.tripId = trip.id
        vc.tripTitle = trip.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
