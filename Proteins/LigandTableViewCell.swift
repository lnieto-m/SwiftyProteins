//
//  LigandTableViewCell.swift
//  Proteins
//
//  Created by Luis NIETO MUNOZ on 9/5/18.
//  Copyright © 2018 Luis NIETO MUNOZ. All rights reserved.
//

import UIKit

class LigandTableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    var nameText: String? {
        didSet {
            if let n = nameText {
                Name.text = n
            }
        }
    }

}
