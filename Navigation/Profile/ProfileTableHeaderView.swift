//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Maru Eremenko on 06.04.2023.
//

import UIKit

class ProfileTableHeaderView: UIView{
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
     
//     private lazy var button: UIButton = {
//         let button = UIButton()
//         button.setTitle("New button", for: .normal)
//         button.setTitleColor(.systemBlue, for: .normal)
//         button.translatesAutoresizingMaskIntoConstraints = false
//         return button
//     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(profileHeaderView)
//        self.addSubview(button)
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
//            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            button.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
//            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            button.heightAnchor.constraint(equalToConstant: 50)
        ])
      
    }
 
    
}
