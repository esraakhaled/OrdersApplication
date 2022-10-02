//
//  OrdersViewController+APICallPreviousOrders.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 27/09/2022.
//

import UIKit
import Alamofire

extension OrdersViewController {
    
    func callLastOrders() {
        let paramGet = [
            "client_id": "342",
            "lang": "en"
        ]
        NetworkCall.shared.fetchData(url: URLs.shared.getURL(for: .getLastOrders), method: .get, encoding: URLEncoding.default, parameters: paramGet, headers: nil) { (result: Result<PreviousProducts,Error>) in
            print(result)
            switch result{
            case .success(let get):
                self.product = get
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
