//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Maru Eremenko on 14.04.2023.
//

import UIKit

protocol PhotoTableViewCellDelegate: AnyObject {
    func tapAction()
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        button.addTarget(self, action: #selector(goToGallery), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goToGallery() {
        delegate?.tapAction()
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
        contentView.addSubview(contentPhoto)
        contentPhoto.addArrangedSubview(firstPicture)
        contentPhoto.addArrangedSubview(secondPicture)
        contentPhoto.addArrangedSubview(thirdPicture)
        contentPhoto.addArrangedSubview(fourthPicture)
        NSLayoutConstraint.activate([
            contentTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            title.leadingAnchor.constraint(equalTo: contentTitle.leadingAnchor, constant: 12),
            title.topAnchor.constraint(equalTo: contentTitle.topAnchor, constant: 12),
            title.bottomAnchor.constraint(equalTo: contentTitle.bottomAnchor, constant: 12),

            button.trailingAnchor.constraint(equalTo: contentTitle.trailingAnchor, constant: -12),
            button.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            
            contentPhoto.topAnchor.constraint(equalTo: contentTitle.bottomAnchor, constant: 12),
            contentPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            contentPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12),
            contentPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            contentPhoto.heightAnchor.constraint(equalToConstant: (contentView.bounds.width - 24) / 4)
        
        ])
    }
}
