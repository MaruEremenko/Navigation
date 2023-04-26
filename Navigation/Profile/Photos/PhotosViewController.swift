//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Maru Eremenko on 14.04.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private lazy var collection: UICollectionView = {
        let spacing: CGFloat = 4
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / 3.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0 / 3.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collection
}()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.width - 40), y: 40, width: 50, height: 50))
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        closeButton.alpha = 0
        return closeButton
    }()
    
    private let backgroundImageView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Photo Gallery"
        setupCollection()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupCollection() {
        view.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4)
        ])
    }
    
    @objc private func closeButtonTap() {
        UIButton.animate(withDuration: 0.3) {
            self.closeButton.alpha = 0
        }
        UIView.animate(withDuration: 0.5, delay: 0.3) {
            self.imageView.frame.size = CGSize(width: (self.view.frame.width / 3.0), height: (self.view.frame.height / 3.0))
            self.backgroundImageView.alpha = 0
        } completion: { _ in
            self.backgroundImageView.removeFromSuperview()
            self.closeButton.removeFromSuperview()
            self.imageView.removeFromSuperview()
            self.navigationController?.navigationBar.isHidden = false
            self.navigationItem.hidesBackButton = false
        }
    }
    
    private func animationImage(avatarImage: UIImage?) {
        self.navigationController?.navigationBar.isHidden = true
        navigationItem.hidesBackButton = true
        view.addSubview(backgroundImageView)
        view.addSubview(closeButton)
        imageView.image = avatarImage
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        imageView.frame = CGRect(x: 0, y: 0, width: (view.frame.width / 2), height: (view.frame.height / 2))
        view.addSubview(imageView)
        UIView.animate(withDuration: 0.5) {
            self.imageView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
            self.backgroundImageView.alpha = 0.7
        }
        
        UIButton.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = 1
        }
    }
}


extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        PhotosViewController.photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotosCollectionViewCell
        cell.fillCell(photo: PhotosViewController.photosArray[indexPath.row])
        cell.backgroundColor = .blue
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        animationImage(avatarImage: PhotosViewController.photosArray[indexPath.row])
    }
}

extension PhotosViewController {
    static let photosArray: Array<UIImage> =  {
        var array: [UIImage] = []
        for name in 1...20 {
            var image = UIImage(named: "\(name)")
            if let img = image {
                array.append(img)
            }
        }
        return array
    }()
}
