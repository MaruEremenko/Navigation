//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Maru Eremenko on 14.04.2023.
//

import UIKit

protocol PhotoTableViewCellDelegate: AnyObject {
    func tapPhotoAction()
}

class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotoTableViewCellDelegate?
    
    private let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.text = "Photo"
        return title
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        return button
    }()
    
    private let firstPicture: UIImageView = {
       let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.layer.cornerRadius = 6
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    
    private let secondPicture: UIImageView = {
       let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.layer.cornerRadius = 6
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    
    private let thirdPicture: UIImageView = {
       let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.layer.cornerRadius = 6
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    
    private let fourthPicture: UIImageView = {
       let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.layer.cornerRadius = 6
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    
    private let contentPhoto: UIStackView = {
        let content = UIStackView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.axis = .horizontal
        content.spacing = 8
        content.alignment = .fill
        content.distribution = .fillEqually
        return content
    }()
    
    private let contentTitle: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var collection: UICollectionView = {
        let spacing: CGFloat = 4
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / 4.0),
            heightDimension: .fractionalHeight(0.8)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0 / 4.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.register(ProfilePhotoCollectionViewCell.self, forCellWithReuseIdentifier: "profilePhotoCollectionViewCell")
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        button.addTarget(self, action: #selector(goToGallery), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goToGallery() {
        delegate?.tapPhotoAction()
    }
    
    func fillCell() {
        firstPicture.image = UIImage(named: "1")
        secondPicture.image = UIImage(named: "2")
        thirdPicture.image = UIImage(named: "3")
        fourthPicture.image = UIImage(named: "4")
    }
    
    private func setupViews() {
        contentView.addSubview(contentTitle)
        contentTitle.addSubview(title)
        contentTitle.addSubview(button)
        contentView.addSubview(collection)
        NSLayoutConstraint.activate([
            contentTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            title.leadingAnchor.constraint(equalTo: contentTitle.leadingAnchor, constant: 12),
            title.topAnchor.constraint(equalTo: contentTitle.topAnchor, constant: 12),
            title.bottomAnchor.constraint(equalTo: contentTitle.bottomAnchor, constant: 12),

            button.trailingAnchor.constraint(equalTo: contentTitle.trailingAnchor, constant: -12),
            button.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            
            collection.topAnchor.constraint(equalTo: contentTitle.bottomAnchor, constant: 12),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            collection.heightAnchor.constraint(equalToConstant: (contentView.bounds.width - 24) / 4)
        
        ])
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        PhotosViewController.photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profilePhotoCollectionViewCell", for: indexPath) as! ProfilePhotoCollectionViewCell
        cell.fillCell(photo: PhotosViewController.photosArray[indexPath.row])
        return cell
    }
    
}
