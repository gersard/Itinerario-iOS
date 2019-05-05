//
//  ActivitiesVC.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/23/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class ActivitiesVC: UIViewController {
    
    @IBOutlet weak var ivBackground: UIImageView!
    @IBOutlet weak var tvActivities: UITableView!
    @IBOutlet weak var btnAdd: AppUiButton!
    var tripId: UUID!
    var tripTitle: String?
    var tripModel: TripModel?
    var sectionHeaderHeight: CGFloat = 54

    override func viewDidLoad() {
        super.viewDidLoad()
        title = tripTitle
        btnAdd.styleToFloatingActionButton()
        self.tvActivities.dataSource = self
        self.tvActivities.delegate = self
        
        updateTvTrips()
        
        sectionHeaderHeight = tvActivities.dequeueReusableCell(withIdentifier: HeaderTVCell.identifier)!.contentView.bounds.height
    }
    
    fileprivate func updateTvTrips() {
        Tripfunctions.readTrip(by: tripId) { [weak self] (tripModel) in
            guard let self = self else {return}
            self.tripModel = tripModel
            
            guard let model = tripModel else {return}
            //            self.title = model.title
            self.ivBackground.image = model.image
            self.tvActivities.reloadData()
        }
    }
    
    
    @IBAction func btnAddPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Wich would you like to add?", message: nil, preferredStyle: .actionSheet)
        let dayAction = UIAlertAction(title: "Day", style: .default, handler: handleAddDay)
        let activityAction = UIAlertAction(title: "Activity", style: .default) { (_) in
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancelAction)
        
        alert.popoverPresentationController?.sourceView = sender as? UIView
//        alert.popoverPresentationController?.sourceRect = ((sender as? UIView)?.bounds)!
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: btnAdd.bounds.width, height: btnAdd.bounds.height)
//        alert.view.tintColor = Theme.tint
        
        present(alert, animated: true, completion: nil)
    }
    
    func handleAddDay(action: UIAlertAction){
//        let storyboard = UIStoryboard(name: String(describing: AddDayVC.self), bundle: nil)
//        let vc = storyboard.instantiateInitialViewController()!
        let vc = AddDayVC.getInstance() as! AddDayVC
        vc.tripModel = self.tripModel
        vc.tripIndex = Data.tripModels.firstIndex(where: { (tripModel) -> Bool in
            tripModel.id == self.tripId
        })
        vc.doneSaving = { [weak self] (dayModel) in
            guard let self = self else {return}
//            self.updateTvTrips()
//            let indexArray = [self.tripModel?.dayModels.count ?? 0]
            self.tripModel?.dayModels.append(dayModel)
            
            let indexArray = [self.tripModel?.dayModels.firstIndex(of: dayModel) ?? 0]
            
            self.tvActivities.insertSections(IndexSet(indexArray), with: .automatic)
        }
        self.present(vc, animated: true)
    }

}
extension ActivitiesVC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tripModel?.dayModels.count ?? 0
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let title = tripModel?.dayModels[section].title ?? ""
//        let subtitle = tripModel?.dayModels[section].subtitle ?? ""
//        return "\(title)  \(subtitle)"
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RowActivityTVCell.identifier) as? RowActivityTVCell
        let model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        cell?.setup(activity: model!)
        return cell!
    }
    
    
}
extension ActivitiesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTVCell.identifier) as? HeaderTVCell
        let day = tripModel?.dayModels[section]
        cell?.setup(day: day!)
        return cell?.contentView
    }
}
