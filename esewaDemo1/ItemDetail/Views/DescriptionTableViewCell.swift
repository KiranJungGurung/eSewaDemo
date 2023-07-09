//
//  DescriptionTableViewCell.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 20/06/2023.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var checkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return imageView
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 15
        return label
    }()
    
    // MARK: - Constants

    static let reuseIdentifier = "DescriptionTableViewCell"
        
    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        applyAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Setup

    func setupView() {
        self.selectionStyle = .none
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(containerView)
        self.addSubview(checkImage)
        self.addSubview(descLabel)
    }
    
    private func applyAutoLayout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            
            checkImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            checkImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            checkImage.widthAnchor.constraint(equalToConstant: 24),
            checkImage.heightAnchor.constraint(equalToConstant: 24),
            
            descLabel.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: 4),
            descLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4),
            descLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
            descLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4),
            
        ])
        descLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        descLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        descLabel.preferredMaxLayoutWidth = containerView.bounds.width - checkImage.bounds.width - 4
        descLabel.numberOfLines = 0
        
    }
    
    // MARK: - Configuration
    
    func configure(with model: FeaturedProduct) {
        descLabel.text = model.description
    }
    
}



