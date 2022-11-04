//
//  ChatViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/27.
//

import UIKit

import Then
import SnapKit
import SwiftyColor

//MARK: - ChatViewController

final class ChatViewController: UIViewController {
    
    //MARK: - Lazy Components
    
    private lazy var chatCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //MARK: - UI Components
    
    private let friendContainerView = UIView().then {
        $0.backgroundColor = .blue
    }
    
    private let chatLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
        $0.text = "채팅"
    }
    
    private let openChatLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
        $0.text = "오픈채팅"
        $0.textColor = 0xA6A6A6.color
    }
    
    private let plusButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(touchUpPlusButton), for: .touchUpInside)
    }
    
    private let plusImageView = UIImageView().then {
        $0.image = UIImage(named: "iconPlus")
    }
    
    private let settingButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    private let settingImageView = UIImageView().then {
        $0.image = UIImage(named: "settings 1")
    }
    
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
    
    //MARK: - Constants
    
    final let friendListInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    final let friendListLineSpacing: CGFloat = 0
    final let friendListInterItemSpacing: CGFloat = 0
    final let friendCellHeight: CGFloat = 50
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        layout()
        register()
    }
}

//MARK: - Extensions

extension ChatViewController {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        
        [
            friendContainerView,
            chatCollectionView
        ].forEach {
            view.addSubview($0)
        }
        
        [
            chatLabel,
            openChatLabel,
            settingButton,
            plusButton
        ].forEach {
            friendContainerView.addSubview($0)
        }
        
        friendContainerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        chatLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
        }
        
        openChatLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(chatLabel.snp.trailing).offset(7)
        }
        
        settingButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        
        plusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(settingButton.snp.leading).offset(-12)
        }

        chatCollectionView.snp.makeConstraints {
            $0.top.equalTo(friendContainerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
//            $0.height.equalTo(calculateCellHeight())
        }
    }
    
    //MARK: - General Helpers
    
    private func register() {
        chatCollectionView.register(ChatCollectionViewCell.self, forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(friendList.count)
        return count * friendCellHeight + (count - 1) * friendListLineSpacing + friendListInset.top + friendListInset.bottom
    }
    
    //MARK: - Action Helpers
    
    @objc
    private func touchUpPlusButton() {
        let photoGridVC = PhotoGridViewController()
        photoGridVC.modalPresentationStyle = .fullScreen
        
        self.present(photoGridVC, animated: true, completion: nil)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth - friendListInset.left - friendListInset.right
        
        return CGSize(width: cellWidth, height: screenWidth * (50 / screenWidth))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return friendListLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return friendListInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return friendListInset
    }
}

//MARK: - UICollectionViewDataSource

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let chatCell = chatCollectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath) as? ChatCollectionViewCell else { return UICollectionViewCell() }
        chatCell.dataBind(model: friendList[indexPath.item])
        return chatCell
    }
}

