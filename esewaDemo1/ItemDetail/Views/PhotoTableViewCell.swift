//
//  PhotoTableViewCell.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 20/06/2023.
//


import Kingfisher
import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    lazy var photoContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Constants
    
    static let reuseIdentifier = "PhotoTableViewCell"
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        applyAutoLayout()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        selectionStyle = .none
        contentView.backgroundColor = .clear
        contentView.addSubview(photoContainerView)
        photoContainerView.addSubview(itemImageView)
    }
    
    private func applyAutoLayout() {
        NSLayoutConstraint.activate([
            photoContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoContainerView.heightAnchor.constraint(equalToConstant: 320),
            
            itemImageView.topAnchor.constraint(equalTo: photoContainerView.topAnchor, constant: 4),
            itemImageView.leadingAnchor.constraint(equalTo: photoContainerView.leadingAnchor, constant: 16),
            itemImageView.trailingAnchor.constraint(equalTo: photoContainerView.trailingAnchor, constant: -16),
            itemImageView.bottomAnchor.constraint(equalTo: photoContainerView.bottomAnchor, constant: 4)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    func configure(with model: FeaturedProduct) {
        if let url = URL(string: model.image ?? "") {
            itemImageView.kf.setImage(with: url)
        }
    }
}



















