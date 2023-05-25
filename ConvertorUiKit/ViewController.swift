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
        tableView.dataSource = self
        tableView.delegate = self
    }

    func gradient(frame:CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.startPoint = CGPointMake(0,0.5)
        layer.endPoint = CGPointMake(1,0.5)
        layer.colors = [
            UIColor.red.cgColor,UIColor.blue.cgColor]
        return layer
    }
    
}



extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return units.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = units[indexPath.row]
     
        
        //Now on your tableViewcell do below
        
        cell.layer.insertSublayer(gradient(frame: cell.bounds), at:1)
        
        return cell
    }
    
    
}



