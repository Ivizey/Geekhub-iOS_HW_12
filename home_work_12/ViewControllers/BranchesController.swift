//
//  BranchesController.swift
//  home_work_12
//
//  Created by Pavel Bondar on 17.01.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

class BranchesController: UIViewController {
    @IBOutlet private weak var branchesTableView: UITableView!
    private let networkServices = NetworkServices()
    private let picker = UIPickerView()
    private let city = ["Одесса",
                        "Днепр",
                        "Чернигов",
                        "Харьков",
                        "Киев",
                        "Днепропетровск"]
    private var branches = [Branches]()
    
    @IBAction private func searchButton(_ sender: UIBarButtonItem) {
        createAlert()
    }
    
    private func getBranches(searchValue: String) {
        networkServices.fetchBranches(search: searchValue) { [weak self] (branches, error) in
            DispatchQueue.main.async {
                self?.branches = branches ?? [Branches]()
                self?.branchesTableView.reloadData()
            }
        }
    }
    
    private func createAlert() {
        let alert = UIAlertController(title: "Оберіть місто", message: "\n\n\n\n\n", preferredStyle: .alert)
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
        alert.view.addSubview(pickerFrame)
        pickerFrame.dataSource = self
        pickerFrame.delegate = self
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(alert,animated: true, completion: nil )
    }
}

extension BranchesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return branches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BranchesCell", for: indexPath) as! BranchesCell
        cell.setNameLabel(name: branches[indexPath.row].name)
        cell.cityLabel(city: branches[indexPath.row].city)
        cell.phoneLabel(phone: branches[indexPath.row].phone)
        cell.emailLabel(email: branches[indexPath.row].email)
        cell.addressLabel(address: branches[indexPath.row].address)
        return cell
    }
}

extension BranchesController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return city.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return city[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getBranches(searchValue: city[row])
    }
}
