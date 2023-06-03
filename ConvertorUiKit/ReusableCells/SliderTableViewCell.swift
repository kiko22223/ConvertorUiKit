//
//  SliderTableViewCell.swift
//  ConvertorUiKit
//
//  Created by Christian Marušák on 02/06/2023.
//

import UIKit

struct SliderUnits {
    let units: [String] = ["km","m","cm","mm","Mi","Yd","Ft","In"]
    let numberOfSegments = 0
}

class SliderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var UnitsSlider: UISegmentedControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
