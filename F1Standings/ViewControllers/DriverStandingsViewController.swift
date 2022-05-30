//
//  DriverStandingsViewController.swift
//  F1Standings
//
//  Created by RYAN GREENBURG on 5/30/22.
//

import UIKit

class DriverStandingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var driverStandings: DriverStandings? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        F1NetworkService().fetchDriversStandings { driverStandings in
            guard let driverStandings = driverStandings else {
                return
            }
            self.driverStandings = driverStandings
        }
    }
}

extension DriverStandingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driverStandings?.drivers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
