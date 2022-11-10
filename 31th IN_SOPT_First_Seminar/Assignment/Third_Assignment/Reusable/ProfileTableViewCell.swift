//
//  ProfileTableViewCell.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/27.
//

import UIKit

import Then
import SnapKit
import SwiftyColor

//MARK: - ProfileTableViewCell

final class ProfileTableViewCell: UITableViewCell {
    
    //MARK: - UI Components
    
    private let imageContainerView = UIView()
    private let profileImageView = UIImageView()
    
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    private let statusLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    //MARK: - Identifier
    
    static let identifier = "ProfileTableViewCell"
    
    //MARK: - Life Cycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extensions

extension ProfileTableViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [imageContainerView, profileImageView, nameLabel, statusLabel].forEach {
            contentView.addSubview($0)
        }
        
        imageContainerView.addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(41)
            $0.width.equalTo(41)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalTo(self.imageContainerView.snp.trailing).offset(11)
        }
        
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(self.nameLabel)
        }
    }
    
    //MARK: - General Helpers
    
    func dataBind(model: FriendModel) {
        nameLabel.text = model.name
        statusLabel.text = model.status
        profileImageView.image = UIImage(named: model.profileImage)
    }
}


