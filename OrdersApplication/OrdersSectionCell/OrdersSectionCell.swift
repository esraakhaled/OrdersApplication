//
//  OrdersSectionCell.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 23/09/2022.
//

import UIKit

class OrdersSectionCell: UITableViewCell {

    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var orderTime: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var orderNum: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var parentView: UIView!
    
    var pressed: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.borderPrimary?.cgColor
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func expandPressed(_ sender: Any) {
        self.pressed?()
    }
}
