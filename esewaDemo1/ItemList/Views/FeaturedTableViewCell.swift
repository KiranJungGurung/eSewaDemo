//
//  FeaturedTableViewCell.swift
//  esewaDemo1
//
//  Created by Kiran Gurung on 20/06/2023.
//

import UIKit

class FeaturedTableViewCell: UITableViewCell {
    
    private let cellReuseIdentifier = "FeaturedTableViewCell"
    
    var model : [FeaturedProduct]?
    var productClicked: ((FeaturedProduct) -> ())?
   
    lazy var featuredCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    static let reuseIdentifier = "FeaturedTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(featuredCollectionView)
        applyAutoLayout()
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        
        featuredCollectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    private func applyAutoLayout() {
        NSLayoutConstraint.activate([
            featuredCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            featuredCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            featuredCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            featuredCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            featuredCollectionView.heightAnchor.constraint(equalToConstant: 900),
           ])
    }
 
    func configure(model: [FeaturedProduct]) {
        self.model = model
        featuredCollectionView.reloadData()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension FeaturedTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! FeaturedCell
        if let item = model?[indexPath.row] {
            cell.configure(with: item)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let item = model?[indexPath.row]
            if let item = item {
                self.productClicked?(item)
            }
        }
}
extension FeaturedTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
}







