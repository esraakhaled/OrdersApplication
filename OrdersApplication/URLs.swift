//
//  URLs.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 27/09/2022.
//

import Foundation

final class URLs {
    //MARK: -Constants
    static let shared = URLs()
    
    //MARK: -Initializers
    private init() {}
    
    //MARK: -Variables
    private var baseURL = "http://pistacoapp.com/api/"
    
    //MARK: -Enum
    enum Services: String {
        
        case getLastOrders = "my-last-orders.php"
    }
    //MARK: -Functions
    func getURL(for service: Services) -> String {
        return baseURL + service.rawValue
    }
}

