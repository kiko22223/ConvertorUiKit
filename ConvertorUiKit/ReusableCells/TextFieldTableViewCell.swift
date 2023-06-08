//
//  TextFieldTableViewCell.swift
//  ConvertorUiKit
//
//  Created by Christian Marušák on 08/06/2023.
//

import UIKit

protocol TextFieldTableViewCellDelegate: AnyObject {
    func textFieldValueChanged(to value: Double)
}

class TextFieldTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!

    weak var delegate: TextFieldTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }

    @IBAction func editingChanged(_ sender: UITextField) {
        if let value = Double(sender.text ?? "") {
            delegate?.textFieldValueChanged(to: value)
        }
    }
}

extension TextFieldTableViewCell: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }

}
