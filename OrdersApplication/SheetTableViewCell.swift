//
//  SheetTableViewCell.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 24/09/2022.
//

import UIKit

class SheetTableViewCell: UITableViewCell {

    @IBOutlet weak var sumValue: UILabel!
    @IBOutlet weak var discountValue: UILabel!
    @IBOutlet weak var addedValue: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.borderPrimary?.cgColor
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
