//
//  ViewController.swift
//  AlamofireTest2
//
//  Created by Yuki Shinohara on 2020/07/01.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var countries = [Country]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        let service = Service(baseUrl: "https://restcountries.eu/rest/v2")
        service.getAllCountryNameFrom(endPoint: "/all")
        service.completionHandler { [weak self](countries, status, message) in
            if status{
                guard let self = self else {return}
                guard let countries = countries else {return}
                self.countries = countries
                self.tableView.reloadData()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        cell.detailTextLabel?.text = countries[indexPath.row].capital
        return cell
    }
}

