//
//  ViewController.swift
//  ConvertorUiKit
//
//  Created by Christian Marušák on 18/05/2023.
//

import UIKit

class MenuViewController: UIViewController {

    let cells : [MenuTableViewCellDescription] = [
        MenuTableViewCellDescription(title: "Lenght",
                                     imageName: "imageKM",
                                     gradientStartColor: .blue, gradientEndColor: .cyan,
                                     units: Units(units: ["km", "m", "cm", "mm", "Mi", "Yd", "Ft", "In"],
                                                  sections: [Section(title: "Zadajte dĺžku", units: []),
                                                             Section(title: "Metrické", units: [0, 1, 2, 3]),
                                                             Section(title: "Imperiálne", units: [4, 5, 6, 7])],
                                                  ratios: [1000, 1, 0.01, 0.001, 1609.344, 0.9144, 0.3048, 0.0254])),
        MenuTableViewCellDescription(title: "Volume",
                                     imageName: "imageML",
                                     gradientStartColor: .orange, gradientEndColor: .yellow,
                                     units: Units(units: ["l", "ml", "cup", "pt", "gl"],
                                                  sections: [Section(title: "Zadajte objem", units: []),
                                                             Section(title: "Metrické", units: [0, 1]),
                                                             Section(title: "Imperiálne", units: [2, 3, 4])],
                                                  ratios: [1000, 1, 236.588237, 473.176473, 3785.41178])),
        MenuTableViewCellDescription(title: "Weight",
                                     imageName: "imageKG",
                                     gradientStartColor: .red, gradientEndColor: .blue,
                                     units: Units(units: ["mg", "g", "dk", "kg", "q", "T"],
                                                  sections: [Section(title: "Zadajte hmotnosť", units: []),
                                                             Section(title: "Metrické", units: [0, 1, 2, 3,]),
                                                             Section(title: "Imperiálne", units: [4, 5])],
                                                  ratios: [10e-6, 0.001, 0.01, 1, 100, 1000])),
        MenuTableViewCellDescription(title: "Energy",
                                     imageName: "imageC",
                                     gradientStartColor: UIColor.blue, gradientEndColor: UIColor.purple,
                                     units: Units(units: ["J", "Nm", "mJ", "kJ", "MJ", "GJ", "TJ"],
                                                 sections: [Section(title: "Zadajte teplo", units: []),
                                                            Section(title: "Teplo", units: [0, 1, 2, 3, 4, 5, 6])],
                                                  ratios: [1, 1, 0.001, 1000, 10e6, 10e9, 10e12]))]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.prefersLargeTitles = true // set in storyboard
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuCell")
//        tableView.dataSource = self // set in storyboard
//        tableView.delegate = self // set in storyboard
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (context: UIViewControllerTransitionCoordinatorContext) -> Void in

        }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            self.tableView.reloadData()
        })

        super.viewWillTransition(to: size, with: coordinator)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = sender as? Int,
              let destinationVC = segue.destination as? ConvertingUnitsViewController else { return }
        destinationVC.units = cells[index].units
        destinationVC.title = cells[index].title
    }

}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showConverting", sender: indexPath.row)
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



