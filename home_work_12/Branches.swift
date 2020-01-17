//
//  Branches.swift
//  home_work_12
//
//  Created by Pavel Bondar on 17.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

struct Branches: Decodable {
    let country: String
    let state: String
    let city: String
    let index: String
    let address: String
    let phone: String
    let email: String
    let name: String
}

class BranchesView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestExchangeRate(search: "Днепропетровск")
    }
    
    private func requestExchangeRate(search: String) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.privatbank.ua"
        components.path = "/p24api/pboffice"
        components.queryItems = [URLQueryItem(name: "json", value: nil),
                                 URLQueryItem(name: "city", value: search),
                                 URLQueryItem(name: "address", value: nil)]
        guard let url = components.url else { return }
        URLSession
            .shared
            .dataTask(with: url) { (data, response, error) in
                guard let response = response as? HTTPURLResponse else { return }
                if let data = data, (200...299).contains(response.statusCode) {
                    self.handle(responceData: data)
                }
        }.resume()
    }
    
    private func handle(responceData: Data) {
        do {
            let branches = try JSONDecoder().decode([Branches].self, from: responceData)
            debugPrint(branches)
        } catch {
            print(error)
        }
    }
}
