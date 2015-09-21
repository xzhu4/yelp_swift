//
//  SwtchCell.swift
//  Yelp
//
//  Created by Xiuming Zhu on 9/20/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc  protocol SwitchCellDelegate {
    optional func switchCell(switchcell: SwtchCell, didChangeValue value: Bool)
}

class SwtchCell: UITableViewCell {

    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    weak var delegate : SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged() {
        if delegate != nil {
            delegate?.switchCell?(self, didChangeValue: onSwitch.on)
        }
    }

}
