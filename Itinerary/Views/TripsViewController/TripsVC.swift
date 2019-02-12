//
//  TripsVC.swift
//  Itinerary
//
//  Created by Gerardo Mascayano on 2/11/19.
//  Copyright © 2019 Gerardo Mascayano. All rights reserved.
//

import UIKit

class TripsVC: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tvTrip: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tvTrip.dataSource = self
        
        Tripfunctions.readTrips {[weak self] in
            self?.tvTrip.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = Data.tripModels[indexPath.row].title
        
        return cell!
    }

}
