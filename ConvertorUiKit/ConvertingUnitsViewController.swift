//
//  ConvertingViewController.swift
//  ConvertorUiKit
//
//  Created by Radovan Bojkovský on 03/06/2023.
//

import UIKit

class ConvertingUnitsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    public var units: Units!
    private var value: Double = 1
    private var selectedUnitIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SliderTableViewCell", bundle: nil), forCellReuseIdentifier: "sliderCell")
        tableView.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "textCell")
        tableView.dataSource = self
    }

}

extension ConvertingUnitsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return units.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        return units.sections[section].units.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        units.sections[section].title.uppercased()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "textCell",
                                                         for: indexPath) as! TextFieldTableViewCell
                cell.delegate = self
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell",
                                                         for: indexPath) as! SliderTableViewCell
                cell.setup(with: units.units, delegate: self)
                return cell
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default,
                                                                                            reuseIdentifier: "cell")
        cell.selectionStyle = .none
        let fromUnit = units.units[selectedUnitIndex]
        let toUnit =  units.units[units.sections[indexPath.section].units[indexPath.row]]
        cell.textLabel?.text = units.convert(value: value, fromUnit: fromUnit, toUnit: toUnit)
        return cell
    }

    fileprivate func updateSections() {
        var indexPaths: [IndexPath] = []
        (1..<units.sections.count).forEach{section in
            let indexPathsInSection = units.sections[section].units.enumerated().map{index, _ in
                IndexPath(row: index, section: section)
            }
            indexPaths.append(contentsOf: indexPathsInSection)
        }
            tableView.reloadRows(at: indexPaths, with: .none)
    }
}

extension ConvertingUnitsViewController: SliderTableViewCellDelegate {
    func sliderValueChanged(to index: Int) {
        selectedUnitIndex = index
        updateSections()
    }
}

extension ConvertingUnitsViewController: TextFieldTableViewCellDelegate {
    func textFieldValueChanged(to value: Double) {
        self.value = value
        updateSections()
    }
}


