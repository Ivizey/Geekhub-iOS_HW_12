//
//  RateCell.swift
//  home_work_12
//
//  Created by Pavel Bondar on 18.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class RateCell: UITableViewCell {
    @IBOutlet private weak var currencyImage: UIImageView!
    @IBOutlet private weak var currencyBaseCurrency: UILabel!
    @IBOutlet private weak var buyLabel: UILabel!
    @IBOutlet private weak var sellLabel: UILabel!
    
    func setImage(image: UIImage) {
        currencyImage.image = image
    }
    
    func setBaseCurrency(currency: String, baseCurrency: String) {
        currencyBaseCurrency.text = currency + "/" + baseCurrency
    }
    
    func setBuy(buy: Double) {
        buyLabel.text = "Купівля: " + String(format: "%.2f", buy)
    }
    
    func setSell(sell: Double) {
        sellLabel.text = "Продаж: " + String(format: "%.2f", sell)
    }
}
