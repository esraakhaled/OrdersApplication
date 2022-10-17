//
//  ItemsCell.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 24/09/2022.
//

import UIKit
import SDWebImage

class ItemsCell: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var quantityValue: UILabel!
    @IBOutlet weak var unitValue: UILabel!
    @IBOutlet weak var priceValue: UILabel!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureViews() {
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.borderPrimary?.cgColor
        parentView.layer.cornerRadius = 5.0
        parentView.layer.masksToBounds = true
    }
    func configureCell(product: Product?) {
        unitValue.text = (product?.items?[0].price ?? "50")+" BD"
        quantityValue.text = product?.items?[0].quantity
        priceValue.text = (product?.items?[0].sizePrice ?? "50")+" BD"
        if let imgStr = product?.items?[0].subCategoryImage {
            itemImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            itemImage.sd_setImage(with: URL(string: imgStr), placeholderImage: UIImage(named: "armchair"))
        }
    }
}
