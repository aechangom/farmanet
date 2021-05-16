//
//  PharmacyTableViewCell.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import UIKit

class PharmacyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var localidad: UILabel!
    @IBOutlet weak var addresss: UILabel!
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
