//
//  OrdersViewController+Delegate.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 23/09/2022.
//

import UIKit

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if section1Expanded == false {
                return 0
            }else{
                if previous.isSelected == true {
                    return 2
                }
                else {
                    return 3
                }
                
            }
        }else if section == 1{
            if section2Expanded == false {
                return 0
            }else{
                if previous.isSelected == true {
                    return 2
                }
                else {
                    return 3
                }
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "OrdersSectionCell") as! OrdersSectionCell
        //header.headerTitleLabel.text = "section\(section)"
        if section == 0 {
            if section1Expanded {
                header.arrowImage.image = UIImage(named: "angle-right")
            }else{
                header.arrowImage.image = UIImage(named: "right_icon")
            }
        }else if section == 1 {
            if section2Expanded {
                header.arrowImage.image = UIImage(named: "angle-right")
            }else{
                header.arrowImage.image = UIImage(named: "right_icon")
            }
        }
        header.pressed = {
            if section == 0 {
                self.section1Expanded.toggle()
                tableView.reloadData()
            }else if section == 1 {
                self.section2Expanded.toggle()
                tableView.reloadData()
            }
        }
        return header
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
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsCell", for: indexPath) as! ItemsCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SheetTableViewCell", for: indexPath) as! SheetTableViewCell
                return cell
            }
        }
        else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsCell", for: indexPath) as! ItemsCell
                return cell
            }
            else if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressCell", for: indexPath) as! ProgressCell
                return cell
                
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SheetTableViewCell", for: indexPath) as! SheetTableViewCell
                return cell
            }
        }
        
        
    }
}

