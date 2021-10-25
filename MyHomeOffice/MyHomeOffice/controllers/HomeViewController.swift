//
//  HomeViewController.swift
//  MyHomeOffice
//
//  Created by Johnson Liu on 10/25/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var rowsList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        
        rowsList = ["Face ID"]
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        
        cell!.textLabel?.text = rowsList[indexPath.row]
        cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //
    }
}
