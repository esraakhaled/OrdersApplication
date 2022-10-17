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
        configureView()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func expandPressed(_ sender: Any) {
        self.pressed?()
    }
    func configureView() {
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.borderPrimary?.cgColor
    }
    func configureCell(product: Product?) {
        var str = product?.orderDate
        var strArray = str!.components(separatedBy: " ")
        let x =  convertDateFormat(inputDate: product?.orderDate ?? "22-9")
        var strArray1 = x.components(separatedBy: " ")
        orderDate.text = strArray[0]
        orderTime.text = strArray1[0] + "" + strArray1[1]
        orderNum.text = "Order Num: "+(product?.orderID ?? "7")
        totalPrice.text = "Total: " + (product?.totalPrice ?? "50")+" BD"
    }
    func convertDateFormat(inputDate: String) -> String {
        
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let oldDate = olDateFormatter.date(from: inputDate)
        
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "h:mm a"
        return convertDateFormatter.string(from: oldDate ?? Date())
    }
}
