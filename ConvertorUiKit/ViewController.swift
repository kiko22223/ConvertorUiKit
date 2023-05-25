//
//  ViewController.swift
//  ConvertorUiKit
//
//  Created by Christian Marušák on 18/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let units = ["weight", "lenght", "value"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    
    
}



extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return units.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
        let description = MenuTableViewDescription(title: units[indexPath.row],
                                                   image: nil,
                                                   gradientStartColor: UIColor.orange,
                                                   gradientEndColor: UIColor.yellow)
        cell.setup(with: description)
     
        
        return cell
    }
    
    
}



