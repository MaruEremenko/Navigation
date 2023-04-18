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
    collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    return collection
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
