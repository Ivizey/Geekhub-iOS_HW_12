//
//  ViewController.swift
//  home_work_12
//
//  Created by Pavel Bondar on 17.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

struct Rate: Decodable {
     let currency: String
     let baseCurrency: String
     let buy: Double
     let sell: Double
    
    enum CodingKeys: String, CodingKey {
        case currency = "ccy"
        case baseCurrency = "base_ccy"
        case buy
        case sell = "sale"
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        requestExchangeRate()
    }
    
    private func requestExchangeRate() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.privatbank.ua"
        components.path = "/p24api/pubinfo"
        components.queryItems = [URLQueryItem(name: "exchange", value: nil),
                                 URLQueryItem(name: "json", value: nil),
                                 URLQueryItem(name: "coursid", value: "11")]
        guard let url = components.url else { return }
        URLSession
            .shared
            .dataTask(with: url) { data, response, error in
                guard let response = response as? HTTPURLResponse else { return }
                if let data = data, (200...299).contains(response.statusCode) {
                    self.handle(responseData: data)
                }
        }.resume()
    }
    
    private func handle(responseData: Data) {
        do {
            let rates = try JSONDecoder().decode([Rate].self, from: responseData)
            debugPrint(rates)
        } catch {
            print(error)
        }
    }
}

extension Rate {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.currency = try container.decode(String.self, forKey: .currency)
        self.baseCurrency = try container.decode(String.self, forKey: .baseCurrency)
        self.buy = try container.decode(Double.self, forKey: .buy)
        self.sell = try container.decode(Double.self, forKey: .sell)
    }
}
