//
//  ViewController.swift
//  ConvertorUiKit
//
//  Created by Christian Marušák on 18/05/2023.
//

import UIKit

class ViewController: UIViewController {

    let cells : [MenuTableViewCellDescription] = [
        MenuTableViewCellDescription(title: "Weight", image: nil, gradientStartColor: UIColor.red, gradientEndColor: UIColor.orange),
        MenuTableViewCellDescription(title: "Lenght", image: nil, gradientStartColor: UIColor.green, gradientEndColor: UIColor.yellow),
        MenuTableViewCellDescription(title: "Value", image: nil, gradientStartColor: UIColor.blue, gradientEndColor: UIColor.purple)]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
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
        return cells.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
        cell.setup(with: cells[indexPath.row])
        return cell
    }
    
    
}



