//
//  SwitchCell.swift
//  Eatho
//
//  Created by Серафима Зыкова on 11/09/2019.
//  Copyright © 2019 Серафима Зыкова. All rights reserved.
//

import UIKit

class SwitchCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switchItem: UISwitch!
    
    var handler: ((_: Bool) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupView(defaultSwitchPosition: Bool, handler: @escaping (_: Bool) -> ()) {
        switchItem.setOn(defaultSwitchPosition, animated: true)
        self.handler = handler
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        guard let handler = handler else { return }
        handler(switchItem.isOn)
    }
}
