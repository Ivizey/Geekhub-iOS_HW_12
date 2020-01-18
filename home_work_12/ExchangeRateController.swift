//
//  ExchangeRateController.swift
//  home_work_12
//
//  Created by Pavel Bondar on 18.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class ExchangeRateController: UIViewController {
    @IBOutlet private weak var rateTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ExchangeRateController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateCell") as! RateCell
        cell.setImage(image: UIImage(systemName: "eurosign.circle") ?? UIImage())
        cell.setBaseCurrency(currency: "EUR", baseCurrency: "UAH")
        cell.setBuy(buy: 15.0)
        cell.setSell(sell: 20.2)
        return cell
    }
}
