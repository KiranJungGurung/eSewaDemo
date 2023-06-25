//
//  ItemInfoTableViewCell.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 20/06/2023.
//


import UIKit

class ItemInfoTableViewCell: UITableViewCell {
    
    private let identifier = "ProductInfoTableViewCell"
    
    var item: FeaturedProduct?
    var footerViewData: ((FeaturedProduct) -> Void)?
    
    lazy var itemContainerView: UIView = {
        let myContainerView = UIView()
        myContainerView.translatesAutoresizingMaskIntoConstraints = false
        myContainerView.backgroundColor = .white
        return myContainerView
    }()
    
    lazy var itemTitleLabel: UILabel = {
        let productTitle = UILabel()
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        productTitle.textAlignment = .left
        productTitle.font = .systemFont(ofSize: 18, weight: .bold)
        productTitle.textColor = .black
        return productTitle
    }()
    
    lazy var priceLabel: UILabel = {
        let pricelbl = UILabel()
        pricelbl.translatesAutoresizingMaskIntoConstraints = false
        pricelbl.textAlignment = .left
        pricelbl.font = .systemFont(ofSize: 26, weight: .medium)
        pricelbl.textColor = .black
        return pricelbl
    }()
    
    lazy var priceCrossedLabel: UILabel = {
        let crossedPricelbl = UILabel()
        crossedPricelbl.translatesAutoresizingMaskIntoConstraints = false
        crossedPricelbl.textAlignment = .left
        crossedPricelbl.font = .systemFont(ofSize: 16, weight: .medium)
        crossedPricelbl.textColor = .gray
        let attributedText = NSAttributedString(
            string: "Rs.500.00",
            attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        crossedPricelbl.attributedText = attributedText
        return crossedPricelbl
    }()
    
    static let reuseIdentifier = "ProductInfoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(itemContainerView)
        itemContainerView.addSubview(itemTitleLabel)
        itemContainerView.addSubview(priceLabel)
        itemContainerView.addSubview(priceCrossedLabel)
        applyAutoLayout()

    }
    private func applyAutoLayout() {
        NSLayoutConstraint.activate([
            itemContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            itemContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            itemTitleLabel.topAnchor.constraint(equalTo: itemContainerView.topAnchor, constant: 10),
            itemTitleLabel.leadingAnchor.constraint(equalTo: itemContainerView.leadingAnchor, constant: 10),
            itemTitleLabel.trailingAnchor.constraint(equalTo: itemContainerView.trailingAnchor, constant: -10),
            
            priceLabel.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor, constant: -10),
            priceLabel.leadingAnchor.constraint(equalTo: itemContainerView.leadingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: itemContainerView.trailingAnchor, constant: -10),
            priceLabel.bottomAnchor.constraint(equalTo: itemContainerView.bottomAnchor, constant: -50),
            
            priceCrossedLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: -16),
            priceCrossedLabel.centerYAnchor.constraint(equalTo: itemContainerView.centerYAnchor, constant: 16),
            priceCrossedLabel.centerXAnchor.constraint(equalTo: itemContainerView.centerXAnchor, constant: 16),
            priceCrossedLabel.bottomAnchor.constraint(equalTo: itemContainerView.bottomAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: FeaturedProduct) {
        itemTitleLabel.text = model.title
        priceLabel.text = "Rs.\(model.price ?? 00)"
    }
  
}

