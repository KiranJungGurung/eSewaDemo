//
//  BasePresenter.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 28/06/2023.
//

import Alamofire
import Foundation
import SwiftyJSON
import UIKit

protocol ItemProtocolDelegate: AnyObject {
    func didFetchProduct(model: [FeaturedProduct])
}

class BasePresenter {
    weak var delegate: ItemProtocolDelegate?

    init(delegate: ItemProtocolDelegate? = nil) {
        self.delegate = delegate
    }
}



// categorixe e
//MKErrorDomain


// what is the difference between  error and exceptions?
//refer to swfit.org















