//
//  OrdersViewController+Delegate.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 23/09/2022.
//

import UIKit


extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        product?.product?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if sectionExpanded == false {
            return 0
        }else{
            if previous.isSelected == true {
                return product?.product?[section].items?.count ?? 0
            }
            else {
                return 2
            }
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "OrdersSectionCell") as! OrdersSectionCell
        header.configureCell(product: product?.product?[section])
        if sectionExpanded {
            header.arrowImage.image = UIImage(named: "angle-right")
        }else{
            header.arrowImage.image = UIImage(named: "right_icon")
        }
        
        header.pressed = {
            self.sectionExpanded.toggle()
            self.callLastOrders()
            tableView.reloadData()
        }
        return header
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if sectionExpanded == true{
            let footer = tableView.dequeueReusableCell(withIdentifier: "SheetTableViewCell") as! SheetTableViewCell
            footer.configureCell(product: product?.product?[section])
            return footer
        }
        else {
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if previous.isSelected == true{
            return UITableView.automaticDimension
        }else{
            if indexPath.row == 1 {
                return 150
            }
            else {
                return UITableView.automaticDimension
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if previous.isSelected == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsCell", for: indexPath) as! ItemsCell
            cell.configureCell(product: product?.product?[indexPath.row])
            return cell
        }
        else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsCell", for: indexPath) as! ItemsCell
                return cell
            }
            else  {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressCell", for: indexPath) as! ProgressCell
                return cell
                
            }
        }
    }
}

