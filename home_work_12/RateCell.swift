//
//  RateCell.swift
//  home_work_12
//
//  Created by Pavel Bondar on 18.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class RateCell: UITableViewCell {
    @IBOutlet weak var currencyImage: UIImageView!
    @IBOutlet weak var currencyBaseCurrency: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var sellLabel: UILabel!
    
    func setImage(image: UIImage) {
        currencyImage.image = image
    }
    
    func setBaseCurrency(currency: String, baseCurrency: String) {
        currencyBaseCurrency.text = currency + "/" + baseCurrency
    }
    
    func setBuy(buy: Double) {
        buyLabel.text = "Купівля: \(buy)"
    }
    
    func setSell(sell: Double) {
        sellLabel.text = "Продаж: \(sell)"
    }
}
