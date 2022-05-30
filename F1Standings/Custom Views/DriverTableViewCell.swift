//
//  DriverTableViewCell.swift
//  F1Standings
//
//  Created by RYAN GREENBURG on 5/30/22.
//

import UIKit

class DriverTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var constructorLabel: UILabel!
    
    func setViews(with model: Driver) {
        nameLabel.text = model.driverDetails.fullName
        rankLabel.text = model.position
        pointsLabel.text = model.points
        nationalityLabel.text = model.driverDetails.nationality
        constructorLabel.text = model.constructorString
    }
}
