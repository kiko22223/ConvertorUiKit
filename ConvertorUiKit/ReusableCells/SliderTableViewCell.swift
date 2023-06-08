//
//  SliderTableViewCell.swift
//  ConvertorUiKit
//
//  Created by Christian Marušák on 02/06/2023.
//

import UIKit

protocol SliderTableViewCellDelegate: AnyObject {
    func sliderValueChanged(to index: Int)
}

class SliderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var unitsSlider: UISegmentedControl!

    weak var delegate: SliderTableViewCellDelegate?
    
    func setup(with units: [String], delegate: SliderTableViewCellDelegate?) {
        unitsSlider.removeAllSegments()
        units.enumerated().forEach{index, unit in
            unitsSlider.insertSegment(withTitle: unit, at: index, animated: false)
        }
        unitsSlider.selectedSegmentIndex = 0
        self.delegate = delegate
    }
    
    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        delegate?.sliderValueChanged(to: sender.selectedSegmentIndex)
    }

}
