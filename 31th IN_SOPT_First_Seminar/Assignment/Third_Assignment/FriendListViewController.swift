//
//  FriendListViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/27.
//

import UIKit

import Then
import SnapKit
import SwiftyColor

//MARK: - FriendListViewController

final class FriendListViewController: UIViewController {
    
    //MARK: - Lazy Components
    
    private lazy var friendListTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    //MARK: - UI Components
    
    private let topContainerVeiw: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let profileContainerView: UIView = {
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
    
    private let settingImageView = UIImageView().then {
        $0.image = UIImage(named: "settings 1")
    }
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        //        button.addTarget(self, action: #selector (touchupProfileButton), for: .touchUpInside)
        return button
    }()
    
    private let profileImageView = UIImageView()
    
    //MARK: - Variables
    
    var friendList:[FriendModel] = [
        FriendModel(name: "가솝트", status: "상태메시지", profileImage: "profileImage1"),
        FriendModel(name: "나솝트", status: "상태메시지", profileImage: "profileImage2"),
        FriendModel(name: "다솝트", status: "상태메시지", profileImage: "profileImage3"),
        FriendModel(name: "라솝트", status: "상태메시지", profileImage: "profileImage4"),
        FriendModel(name: "마솝트", status: "상태메시지", profileImage: "profileImage5"),
        FriendModel(name: "바솝트", status: "상태메시지", profileImage: "profileImage6"),
        FriendModel(name: "사솝트", status: "상태메시지", profileImage: "profileImage7"),
        FriendModel(name: "아솝트", status: "상태메시지", profileImage: "profileImage8"),
        FriendModel(name: "자솝트", status: "상태메시지", profileImage: "profileImage9"),
        FriendModel(name: "차솝트", status: "상태메시지", profileImage: "profileImage9")
    ]
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        //        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        register()
    }
}

//MARK: - Extensions

extension FriendListViewController {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        
        [
            topContainerVeiw,
            profileContainerView,
            friendListTableView
        ].forEach {
            view.addSubview($0)
        }
        
        let width = UIScreen.main.bounds.width
        
        topContainerVeiw.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(width * (52/width))
        }
        
        [
            friendLabel,
            settingButton,
            settingImageView
        ].forEach {
            topContainerVeiw.addSubview($0)
        }
        
        
        friendLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
        }
        
        settingImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-15)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(21)
        }
        
        settingButton.snp.makeConstraints {
            $0.edges.equalTo(self.settingImageView)
        }
        
        friendListTableView.snp.makeConstraints {
            $0.top.equalTo(topContainerVeiw.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(friendList.count * 50)
        }
    }
    
    //MARK: - General Helpers
    
    private func register() {
        friendListTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
    }
    
}

//MARK: - UITableViewDelegate

extension FriendListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//MARK: - UITableViewDataSource

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as?
                ProfileTableViewCell else { return UITableViewCell() }
        
        friendCell.dataBind(model: friendList[indexPath.row])
        return friendCell
    }
}
