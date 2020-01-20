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
    private let networkServices = NetworkServices()
    private let images = ["dollarsign.circle",
                          "eurosign.circle",
                          "rublesign.circle",
                          "bitcoinsign.circle"]
    private var rates = [Rate]()
    
    @IBAction func refreshButton(_ sender: UIBarButtonItem) {
        getRates()
    }
    
    private func getRates() {
        self.networkServices.fetchRate(completionHandler: { [weak self] (rates, error) in
            DispatchQueue.main.async {
                self?.rates = rates ?? [Rate]()
                self?.rateTableView.reloadData()
            }
        })
    }
}

extension ExchangeRateController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateCell", for: indexPath) as! RateCell
        cell.setImage(image: UIImage(systemName: images[indexPath.row]) ?? UIImage())
        cell.setBaseCurrency(currency: rates[indexPath.row].currency, baseCurrency: rates[indexPath.row].baseCurrency)
        cell.setBuy(buy: rates[indexPath.row].buy)
        cell.setSell(sell: rates[indexPath.row].sell)
        return cell
    }
}
