//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Maru Eremenko on 06.04.2023.
//

import UIKit

class ProfileTableHeaderView: UIView{
    
    lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(profileHeaderView)
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
            
        ])
      
    }
 
    
}
