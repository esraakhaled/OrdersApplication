//
//  Product.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 27/09/2022.
//

import Foundation
struct PreviousProducts: Codable {
    let product: [Product]?
    let success: Int?
}

struct Product: Codable {
    let deliverID, clientID, orderDate, orderStatus: String?
    let orderFollow, orderID, discountPercentage, totalPrice: String?
    let chargeCost, totalPriceWithoutCharge, netPrice: String?
    let items: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case deliverID = "deliver_id"
        case clientID = "client_id"
        case orderDate = "order_date"
        case orderStatus = "order_status"
        case orderFollow = "order_follow"
        case orderID = "order_id"
        case discountPercentage = "discount_percentage"
        case totalPrice = "total_price"
        case chargeCost = "charge_cost"
        case totalPriceWithoutCharge = "total_price_without_charge"
        case netPrice = "net_price"
        case items
    }
}

struct Item: Codable {
    let cartID, removeID: String?
    let subCategoryID, subCategoryName, subCategoryDesc: String?
    let subCategoryImage: String?
    let sizeName, sizePrice: String?
    let quantity, price: String?
    
    enum CodingKeys: String, CodingKey {
        case cartID = "cart_id"
        case removeID = "remove_id"
        case subCategoryID = "sub_category_id"
        case subCategoryName = "sub_category_name"
        case subCategoryDesc = "sub_category_desc"
        case subCategoryImage = "sub_category_image"
        case sizeName = "size_name"
        case sizePrice = "size_price"
        case quantity, price
    }
}
