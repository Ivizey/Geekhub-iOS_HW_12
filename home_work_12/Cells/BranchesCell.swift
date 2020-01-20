//
//  BranchesCell.swift
//  home_work_12
//
//  Created by Pavel Bondar on 19.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class BranchesCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    func setNameLabel(name: String) {
        nameLabel.text = name
    }
    
    func cityLabel(city: String) {
        cityLabel.text = "Місто \(city)"
    }
    
    func phoneLabel(phone: String) {
        phoneLabel.text = "Телефон: \(phone)"
    }
    
    func emailLabel(email: String) {
        emailLabel.text = "Ел.пошта: \(email)"
    }
    
    func addressLabel(address: String) {
        addressLabel.text = "Адреса: \(address)"
    }

}
