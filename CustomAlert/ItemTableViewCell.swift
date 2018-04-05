//
//  ItemTableViewCell.swift
//  CustomAlert
//
//  Created by Jigar Shah on 4/5/18.
//  Copyright © 2018 Rakesh. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!

    func updateUI(item: (String, Bool)) {
        titleLabel.text = item.0
        `switch`.isOn = item.1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
