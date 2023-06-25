//
//  ItemListViewController.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 20/06/2023.
//

import Alamofire
import SwiftyJSON
import UIKit

typealias TableViewProtocol = UITableViewDelegate & UITableViewDataSource

class ItemListViewController: BaseViewController, ItemListProtocolDelegate, TableViewProtocol{
    
    var presenter: ItemListPresenter?
    var featuredProduct = [FeaturedProduct]()

    lazy var itemListTableView: UITableView = {
        let itemListTable = UITableView()
        itemListTable.backgroundColor = .gray
        itemListTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return itemListTable
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(itemListTableView)
        view.backgroundColor = .cyan
        setupTableView()
        setupPresenter()
        applyAutolayout()
        
        navigationItem.title = "Item List"
        navigationItem.leftBarButtonItem?.isHidden = true
        
    }
    func setupPresenter() {
        presenter = ItemListPresenter(delegate: self)
        presenter?.fetch()
      }
    
    func didFetchProduct(model: [FeaturedProduct]) {
        self.featuredProduct = model
        itemListTableView.reloadData()
    }
    
    private func setupTableView() {
        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        
        itemListTableView.estimatedRowHeight = 300
        itemListTableView.rowHeight = UITableView.automaticDimension
        itemListTableView.backgroundColor = .clear
        itemListTableView.separatorStyle = .none
        itemListTableView.translatesAutoresizingMaskIntoConstraints = false

        itemListTableView.register(FeaturedTableViewCell.self, forCellReuseIdentifier: FeaturedTableViewCell.reuseIdentifier)
        
    }
    private func applyAutolayout(){
        NSLayoutConstraint.activate([
            itemListTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            itemListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            itemListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            itemListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}

extension ItemListViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemListTableView.dequeueReusableCell(withIdentifier: FeaturedTableViewCell.reuseIdentifier, for: indexPath) as! FeaturedTableViewCell
        cell.configure(model: self.featuredProduct)
        cell.productClicked = { item in
            let viewController = ItemDetailViewController()
            viewController.featureData = item
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        return cell
    }
}




