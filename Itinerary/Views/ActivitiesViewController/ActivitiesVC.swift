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
    var tripId: UUID!
    var tripModel: TripModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tvActivities.dataSource = self
        self.tvActivities.delegate = self
        
        Tripfunctions.readTrip(by: tripId) { [weak self] (tripModel) in
            guard let self = self else {return}
            self.tripModel = tripModel
            
            guard let model = tripModel else {return}
            self.title = model.title
            self.ivBackground.image = model.image
            self.tvActivities.reloadData()
        }
    }
    

}
extension ActivitiesVC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = tripModel?.dayModels[section].title ?? ""
        let subtitle = tripModel?.dayModels[section].subtitle ?? ""
        return "\(title)  \(subtitle)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "activityCell")
        if cell == nil {
            cell = UITableViewCell()
        }
        return cell!
    }
    
    
}
extension ActivitiesVC: UITableViewDelegate{
    
}
