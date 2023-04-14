//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Maru Eremenko on 14.04.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
//    private let collection: UICollectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        navigationController?.title = "Photo Gallery"
//        navigationController?.isNavigationBarHidden = false
//        navigationController?.setNavigationBarHidden(false, animated: true)
//        navigationItem.hidesBackButton = false
        navigationItem.title = "Photo Gallery"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}
