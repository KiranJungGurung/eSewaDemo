//
//  APIManager.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 20/06/2023.
//

import Alamofire
import Foundation
import SwiftyJSON
import UIKit

typealias Handler = (Result<[FeaturedProduct], Error>) -> Void

class APIManager {
    
    static func fetchProducts(completion: @escaping Handler) {
        
        let url = URL(string: getProductURL)
        AF.request(url!).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let products = json.arrayValue.map { FeaturedProduct(json: $0) }
                completion(.success(products))
            case .failure(let error):
                print("Error: \(error)")
                completion(.failure(error))
            }
        }
    }
}



