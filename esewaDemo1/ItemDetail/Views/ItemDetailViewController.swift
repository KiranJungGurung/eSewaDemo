//
//  ItemDetailViewController.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 20/06/2023.
//


import Kingfisher
import UIKit

class ItemDetailViewController: BaseViewController, TableViewProtocol{

    // MARK: - Properties

    var itemDetailSections = [0,1,2,3]
    var featureData: FeaturedProduct?

    private lazy var itemDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        applyAutoLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        itemDetailTableView.frame = view.bounds
    }
    
    // MARK: - Setup

    private func setupView() {
        view.addSubview(itemDetailTableView)
    
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.title = "Item Detail"
    }

    private func setupTableView() {
        itemDetailTableView.delegate = self
        itemDetailTableView.dataSource = self
        itemDetailTableView.backgroundColor = .clear
        itemDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        
        itemDetailTableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.reuseIdentifier)
        itemDetailTableView.register(ItemInfoTableViewCell.self, forCellReuseIdentifier: ItemInfoTableViewCell.reuseIdentifier)
        itemDetailTableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.reuseIdentifier)
    }
    
    private func applyAutoLayout() {
        NSLayoutConstraint.activate([
            itemDetailTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            itemDetailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            itemDetailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            itemDetailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    // MARK: - Event Handlers

    @objc override func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension ItemDetailViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if itemDetailSections[section] == 2 {
            return 1
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch itemDetailSections[section] {
        case 0:
            return ""
        case 1:
            return ""
        case 2:
            return "Description"
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if itemDetailSections[section] == 2 {
        }
        return nil
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch itemDetailSections[indexPath.section] {
        case 0:
            let cell = itemDetailTableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reuseIdentifier, for: indexPath) as! PhotoTableViewCell

            if let featureData = featureData {
                cell.configure(with: featureData)
            }
            return cell

        case 1:
            let cell = itemDetailTableView.dequeueReusableCell(withIdentifier: ItemInfoTableViewCell.reuseIdentifier, for: indexPath) as! ItemInfoTableViewCell
            if let featureData = featureData {
                cell.configure(with: featureData)
            }
            return cell

        default:
            let cell = itemDetailTableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.reuseIdentifier, for: indexPath) as! DescriptionTableViewCell
            if let featureData = featureData {
                cell.configure(with: featureData)
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch itemDetailSections[indexPath.section] {
        case 0:
            return 350
        case 1:
            return 120
        case 2:
            return 100
        default:
            return UITableView.automaticDimension
        }
    }
}


