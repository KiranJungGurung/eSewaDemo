//
//  FeaturedCell.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 20/06/2023.
//

import Kingfisher
import UIKit

class FeaturedCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var model: FeaturedProduct?
    static let identifier = "FeaturedCell"
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 10
        containerView.backgroundColor = .white
        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        containerView.layer.shadowOpacity = 0.4
        containerView.layer.shadowOffset = .zero
        return containerView
    }()
    
    lazy var featuredImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageView
    }()
    
    lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    lazy var productSubTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
   lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.contentMode = .scaleAspectFill
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.tintColor = .gray
        likeButton.isUserInteractionEnabled = true
        return likeButton
    }()
    
   lazy var addContainerView: UIView = {
        let addView = UIView()
        addView.translatesAutoresizingMaskIntoConstraints = false
        addView.backgroundColor  = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        addView.layer.cornerRadius = 9
        addView.layer.maskedCorners = [.layerMinXMinYCorner]
        return addView
    }()
    
    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.contentMode = .scaleAspectFit
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.tintColor = .white
        addButton.isUserInteractionEnabled = true
        return addButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 14
        contentView.addSubview(containerView)
        contentView.addSubview(featuredImageView)
        containerView.addSubview(productTitleLabel)
        containerView.addSubview(productSubTitleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(likeButton)
        containerView.addSubview(addContainerView)
        addContainerView.addSubview(addButton)
        applyAutoLayout()
    }
    
    private func applyAutoLayout() {
        NSLayoutConstraint.activate([
            featuredImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            featuredImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            featuredImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            featuredImageView.heightAnchor.constraint(equalToConstant: 150),
            
            containerView.topAnchor.constraint(equalTo: featuredImageView.bottomAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            productTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            productTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            productTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            productSubTitleLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 8),
            productSubTitleLabel.leadingAnchor.constraint(equalTo: productTitleLabel.leadingAnchor, constant: 0),
            productTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            priceLabel.topAnchor.constraint(equalTo: productSubTitleLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: productSubTitleLabel.leadingAnchor, constant: 0),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            priceLabel.heightAnchor.constraint(equalToConstant: 17),
            
            likeButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            likeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -135),
            likeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            likeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            likeButton.widthAnchor.constraint(equalToConstant: 25),
            likeButton.heightAnchor.constraint(equalToConstant: 25),

            addContainerView.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: -20),
            addContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            addContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            addContainerView.widthAnchor.constraint(equalToConstant: 25),
            addContainerView.heightAnchor.constraint(equalToConstant: 35),
            
            addButton.topAnchor.constraint(equalTo: addContainerView.topAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: addContainerView.leadingAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: addContainerView.trailingAnchor, constant: -8),
            addButton.bottomAnchor.constraint(equalTo: addContainerView.bottomAnchor, constant: -8),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            addButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: FeaturedProduct) {
        self.model = model
        setupImageView()
        setupLabels()
    }
    
    private func setupImageView() {
        guard let urlString = model?.image, let url = URL(string: urlString) else {
            return
        }
        featuredImageView.kf.setImage(with: url)
    }

    private func setupLabels() {
        productTitleLabel.text = model?.title
        productSubTitleLabel.text = model?.category
        priceLabel.text = "Rs. \(model?.price ?? 1)"
    }
}




