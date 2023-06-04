//
//  MenuTableViewCell.swift
//  ConvertorUiKit
//
//  Created by Radovan Bojkovský on 25/05/2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var unitImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    private var data: MenuTableViewCellDescription!
    private let cornerRadius: CGFloat = 7

    private var gradientLayer: CAGradientLayer!

    private func gradient() -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = gradientView.frame
        layer.startPoint = CGPointMake(0, 0)
        layer.endPoint = CGPointMake(1, 1)
        layer.colors = [data.gradientStartColor.cgColor,
                        data.gradientEndColor.cgColor]
        layer.cornerRadius = cornerRadius
        return layer
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        gradientView.layer.cornerRadius = cornerRadius
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = gradient()
        gradientView.layer.addSublayer(gradientLayer)
    }

    func setup(with data: MenuTableViewCellDescription) {
        self.data = data
        titleLabel.text = data.title
        unitImageView.image = UIImage(named: data.imageName)
    }
    
}
