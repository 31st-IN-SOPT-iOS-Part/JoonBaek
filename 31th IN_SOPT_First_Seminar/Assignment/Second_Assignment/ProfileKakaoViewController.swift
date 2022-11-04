//
//  ProfileKakaoViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/13.
//

import UIKit

import SnapKit
import SwiftyColor

//MARK: - ProfileKakaoViewController

class ProfileKakaoViewController: UIViewController {

    //MARK: - UIComponents
    
    private let buttonContainerView = UIView()
    private let leftButtonContainerView = UIView()
    private let midButtonContainerView = UIView()
    private let rightButtonContainerView = UIView()
    
    private let profileImageView = UIImageView()
    private let closeButtonImageView = UIImageView()
    private let chatButtonImageView = UIImageView()
    private let editButtonImageView = UIImageView()
    private let storyButtonImageView = UIImageView()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        label.text = "김솝트"
        return label
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = 0x9FA7AD.color
        return view
    }()
    
    private let chatButton =  UIButton()
    private let editButton = UIButton()
    private let storyButton = UIButton()
    private let closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(closeProfileButton), for: .touchUpInside)
        return button
    }()
    
    private let chatLabel = UILabel()
    private let editLabel = UILabel()
    private let storyLabel = UILabel()
    
    //MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = 0x879198.color
        layout()
        Config()
    }
    
}

//MARK: - Extensions

extension ProfileKakaoViewController {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        
        let components:[Any] = [
            buttonContainerView,
            profileImageView,
            nameLabel,
            underlineView,
            closeButtonImageView,
            closeButton
        ]
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        closeButtonImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalTo(13)
            $0.height.equalTo(14)
        }
        
        closeButton.snp.makeConstraints {
            $0.edges.equalTo(closeButton)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(470)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(97)
            $0.height.equalTo(96)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(42)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        let buttonContainerViews:[Any] = [
            leftButtonContainerView,
            midButtonContainerView,
            rightButtonContainerView
        ]
        
        buttonContainerViews.forEach {
            buttonContainerView.addSubview($0 as! UIView )
        }
        
        buttonContainerView.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(49)
            $0.height.equalTo(72)
        }
        
        midButtonContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(buttonContainerView).dividedBy(3)
            $0.height.equalToSuperview()
        }
        
        leftButtonContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(self.midButtonContainerView)
            $0.height.equalToSuperview()
        }
        
        rightButtonContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(self.midButtonContainerView)
            $0.height.equalToSuperview()
        }
        
        let chatButtonComponents:[Any] = [
            chatButtonImageView,
            chatButton,
            chatLabel
        ]
        
        chatButtonComponents.forEach {
            leftButtonContainerView.addSubview($0 as! UIView)
        }
        
        chatButtonImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(18.2)
            $0.height.equalTo(17.59)
        }
        
        chatButton.snp.makeConstraints {
            $0.edges.equalTo(chatButtonImageView)
        }
        
        chatLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-13)
            $0.centerX.equalToSuperview()
        }
        
        let editButtonComponents:[Any] = [
            editButtonImageView,
            editButton,
            editLabel
        ]
        
        editButtonComponents.forEach {
            midButtonContainerView.addSubview($0 as! UIView)
        }
        
        editButtonImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(17.11)
            $0.height.equalTo(19.29)
        }
        
        editButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        editLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-13)
            $0.centerX.equalToSuperview()
        }
        
        let storyButtonComponents:[Any] = [
            storyButtonImageView,
            storyButton,
            storyLabel
        ]
        
        storyButtonComponents.forEach {
            rightButtonContainerView.addSubview($0 as! UIView)
        }
        
        storyButtonImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(18.55)
            $0.height.equalTo(21.58)
        }
        
        storyButton.snp.makeConstraints {
            $0.edges.equalTo(storyButton)
        }
        
        storyLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-13)
            $0.centerX.equalToSuperview()
        }
    }
    
    //MARK: - General Helpers
    
    private func Config() {
        profileImageView.image = UIImage(named: "profile_userImg")
        chatButtonImageView.image = UIImage(named: "profileTalkImg")
        editButtonImageView.image = UIImage(named: "profile_editImg")
        storyButtonImageView.image = UIImage(named: "profile_editImg")
        closeButtonImageView.image = UIImage(named: "profile_closeBtn")
        
        chatButton.backgroundColor = .clear
        editButton.backgroundColor = .clear
        storyButton.backgroundColor = .clear
        
        chatLabel.text = "나와의 채팅"
        chatLabel.font = .systemFont(ofSize: 10, weight: .regular)
        chatLabel.textColor = 0xECEDEE.color
        
        editLabel.text = "프로필 편집"
        editLabel.font = .systemFont(ofSize: 10, weight: .regular)
        editLabel.textColor = 0xECEDEE.color
        
        storyLabel.text = "카카오스토리"
        storyLabel.font = .systemFont(ofSize: 10, weight: .regular)
        storyLabel.textColor = 0xECEDEE.color
        
    }
    
    //MARK: - Action Helpers
    
    @objc
    private func closeProfileButton() {
        self.dismiss(animated: true)
    }
}
