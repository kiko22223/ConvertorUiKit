//
//  ConvertingViewController.swift
//  ConvertorUiKit
//
//  Created by Radovan Bojkovský on 03/06/2023.
//

import UIKit

class ConvertingUnitsViewController: UIViewController {
    
    

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SliderTableViewCell", bundle: nil), forCellReuseIdentifier: "sliderCell")
        tableView.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "textCell")

    }
    

    
    

    

}

extension ConvertingUnitsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell") as! SliderTableViewCell
        return UITableViewCell()
    }
}


