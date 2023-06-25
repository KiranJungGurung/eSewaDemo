//
//  ItemListPresenter.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 20/06/2023.
//

import Alamofire
import Foundation
import SwiftyJSON
import UIKit

protocol ItemListProtocolDelegate: AnyObject {
    func didFetchProduct(model:[FeaturedProduct])
 }


class ItemListPresenter {
    
    weak var delegate: ItemListProtocolDelegate?

    init(delegate: ItemListProtocolDelegate? = nil) {
        self.delegate = delegate
    }
    
    func fetch() {
        APIManager.fetchProducts { [weak self] result in
            switch result {
            case .success(let model):
                print(model)
                self?.delegate?.didFetchProduct(model: model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
