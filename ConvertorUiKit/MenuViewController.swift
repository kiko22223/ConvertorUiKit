//
//  ViewController.swift
//  ConvertorUiKit
//
//  Created by Christian Marušák on 18/05/2023.
//

import UIKit

struct Section {
    let title: String
    let units: [Int]
}

struct Units {
    let units: [String]
    let sections: [Section]
    let ratios: [Double]
    
    func convert(value: Double, fromUnit: String, toUnit: String) -> String {
        guard let fromIndex = units.firstIndex(of: fromUnit),
              let toIndex = units.firstIndex(of: toUnit),
              ratios.indices.contains(fromIndex),
              ratios.indices.contains(toIndex) else { return "" }
        let basicValue = value / ratios[fromIndex]
        let toValue = basicValue * ratios[toIndex]
        return "\(toValue) \(toUnit)"
    }
}



class MenuViewController: UIViewController {

    let cells : [MenuTableViewCellDescription] = [
        MenuTableViewCellDescription(title: "Lenght", imageName: "imageKM",gradientStartColor: .blue, gradientEndColor: .cyan),
        MenuTableViewCellDescription(title: "Volume", imageName: "imageML", gradientStartColor: .orange, gradientEndColor: .yellow),
        MenuTableViewCellDescription(title: "Weight", imageName: "imageKG",gradientStartColor: .red, gradientEndColor: .blue),
        MenuTableViewCellDescription(title: "Temperature", imageName: "imageC",gradientStartColor: UIColor.blue, gradientEndColor: UIColor.purple)
        ]

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

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
        cell.setup(with: cells[indexPath.row])
        return cell
    }
    
}



