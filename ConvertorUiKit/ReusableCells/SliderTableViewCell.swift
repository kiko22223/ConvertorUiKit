//
//  SliderTableViewCell.swift
//  ConvertorUiKit
//
//  Created by Christian Marušák on 02/06/2023.
//

import UIKit

struct SliderUnits {
    let units = MenuViewController().cells
    let numberOfSegments = 0
}

class SliderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var UnitsSlider: UISegmentedControl!
    
    func setup(with data: MenuTableViewCellDescription) {
        self.UnitsSlider = 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
