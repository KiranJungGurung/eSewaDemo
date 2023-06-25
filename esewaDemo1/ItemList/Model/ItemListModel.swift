//
//  ItemListModel.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 20/06/2023.
//

import Alamofire
import Foundation
import SwiftyJSON
import UIKit

struct FeaturedProduct {
    let id: Int?
    let title: String?
    let price: Double?
    let description:String?
    let category: String?
    let image: String?

    init(json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.price = json["price"].double
        self.description = json["description"].string
        self.category = json["category"].string
        self.image = json["image"].string
    }
}

