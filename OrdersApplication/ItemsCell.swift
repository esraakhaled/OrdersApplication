//
//  ItemsCell.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 24/09/2022.
//

import UIKit

class ItemsCell: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var quantityValue: UILabel!
    @IBOutlet weak var unitValue: UILabel!
    @IBOutlet weak var priceValue: UILabel!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.borderPrimary?.cgColor
        parentView.layer.cornerRadius = 5.0
        parentView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
