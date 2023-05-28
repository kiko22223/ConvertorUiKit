//
//  ViewController.swift
//  ConvertorUiKit
//
//  Created by Christian Marušák on 18/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let units = ["weight", "lenght", "value"]
    let typeOfCell : [[MenuTableViewCellDescription]] = [[MenuTableViewCellDescription(title: "test", image: nil, gradientStartColor: UIColor.black, gradientEndColor: UIColor.blue)], [MenuTableViewCellDescription(title: "test0", image: nil, gradientStartColor: UIColor.black, gradientEndColor: UIColor.white)], [MenuTableViewCellDescription(title: "test1", image: nil, gradientStartColor: UIColor.green, gradientEndColor: UIColor.gray)]]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (context: UIViewControllerTransitionCoordinatorContext) -> Void in

        }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            self.tableView.reloadData()
        })

        super.viewWillTransition(to: size, with: coordinator)
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
//        let description = MenuTableViewCellDescription(title: units[indexPath.row],
//                                                   image: nil,
//                                                   gradientStartColor: UIColor.orange,
//                                                   gradientEndColor: UIColor.yellow)
//        cell.setup(with: description)
//
        let desciption2 = typeOfCell[indexPath.row]
        
        return cell
    }
    
    
}



