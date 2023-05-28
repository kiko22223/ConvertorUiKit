//
//  MenuTableViewCell.swift
//  ConvertorUiKit
//
//  Created by Radovan Bojkovský on 25/05/2023.
//

import UIKit

struct MenuTableViewCellDescription {
    let title: String
    let image: UIImage?
    let gradientStartColor: UIColor
    let gradientEndColor: UIColor
}

class MenuTableViewCell: UITableViewCell {

    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var unitImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    private var data: MenuTableViewCellDescription?
    private let cornerRadius: CGFloat = 10

    private var gradientLayer: CAGradientLayer!

    private func gradient() -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = gradientView.frame
        layer.startPoint = CGPointMake(0,0.5)
        layer.endPoint = CGPointMake(1,0.5)
        layer.colors = [data?.gradientStartColor.cgColor ?? UIColor.red.cgColor,
                        data?.gradientEndColor.cgColor ?? UIColor.blue.cgColor]
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
        unitImageView.image = data.image
    }
    
}
