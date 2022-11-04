//
//  HomeKakaoViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/13.
//

import UIKit

import SnapKit
import SwiftyColor

//MARK: - HomeKakaoViewController

final class HomeKakaoViewController: UIViewController {

    //MARK: - UIComponents
    
    private let friendContainerVeiw: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let friendLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "친구"
        return label
    }()
    
    private let settingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    private let settingImageView = UIImageView()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector (touchupProfileButton), for: .touchUpInside)
        return button
    }()
    
    private let profileImageView = UIImageView()
    
    //MARK: - Identifier
    let homeVC = "HomeKakaoViewController"
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        layout()
        imageConfig()
    }

}

//MARK: - Extensions
extension HomeKakaoViewController {
    
    private func layout() {
        
        let components:[Any] = [
            friendContainerVeiw,
            profileButton,
            settingImageView,
            profileImageView
        ]
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        let width = UIScreen.main.bounds.width
        
        friendContainerVeiw.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(width * (52/width))
        }
        
        let friendComponents:[Any] = [
            friendLabel,
            settingButton,
            settingImageView
        ]
        
        friendComponents.forEach {
            friendContainerVeiw.addSubview($0 as! UIView)
        }
        
        friendLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
        }
        
        settingImageView.snp.makeConstraints {
            $0.leading.equalTo(friendLabel.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(21)
        }
        
        settingButton.snp.makeConstraints {
            $0.edges.equalTo(self.settingImageView)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(friendLabel.snp.bottom)
            $0.leading.equalTo(self.friendLabel)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
        
        profileButton.snp.makeConstraints {
            $0.edges.equalTo(self.profileImageView)
        }
    }
    
    //MARK: - General Helpers
    
    private func imageConfig() {
        settingImageView.image = UIImage(named: "settings 1")
        profileImageView.image = UIImage(named: "profile_userImg")
    }
    
    //MARK: - Action Helpers
    
    @objc
    private func touchupProfileButton() {
        let profileVC = ProfileKakaoViewController()
        profileVC.modalPresentationStyle = .fullScreen
        
        self.present(profileVC, animated: true, completion: nil)
    }
    
}
