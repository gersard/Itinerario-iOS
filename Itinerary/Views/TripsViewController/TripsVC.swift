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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tvTrip.dataSource = self
        self.tvTrip.delegate = self
        
        Tripfunctions.readTrips {[weak self] in
            self?.tvTrip.reloadData()
        }
        
    }

}

extension TripsVC : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell") as! TripTVCell
        
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
