//
//  ProfilePhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Maru Eremenko on 20.04.2023.
//

import UIKit

class ProfilePhotoCollectionViewCell: UICollectionViewCell {
    
    private let photoCell: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.cornerRadius = 6
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFill
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoCell.image = nil
    }
    
    private func setupView() {
        contentView.addSubview(photoCell)
        NSLayoutConstraint.activate([
            photoCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func fillCell(photo: UIImage) {
        photoCell.image = photo
    }
    
}
