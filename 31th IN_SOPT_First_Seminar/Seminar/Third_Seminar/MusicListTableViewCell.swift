//
//  MusicListTableViewCell.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/15.
//

import UIKit

import Then
import SnapKit
import SwiftyColor

//MARK: - MusicListTableViewCell

final class MusicListTableViewCell: UITableViewCell {
    
    //MARK: - UI Components
    
    private let albumContainerView = UIView()
    private let albumImageView = UIImageView()
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    private  let singerLabel = UILabel().then {
        $0.textColor = 0x1E1E1E.color
        $0.font = .systemFont(ofSize: 15, weight: .medium)
    }
    
    private let clickableButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "iconClickable"), for: .normal)
    }
    
    //MARK: - Identifier
    
    static let identifiler = "MusicListTableViewCell"
    
    //MARK: - LifeCycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extensions

extension MusicListTableViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [albumContainerView,titleLabel,singerLabel,clickableButton].forEach {
            contentView.addSubview($0)
        }
        
        albumContainerView.addSubview(albumImageView)
        albumContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(58)
        }
        
        albumImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(albumContainerView.snp.trailing).offset(15)
        }
        
        singerLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(self.titleLabel)
        }
        
        clickableButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-28)
            $0.width.equalTo(24)
            $0.height.equalTo(8)
        }
    }
    
    //MARK: - General Helpers
    
    func dataBind(model: MusicModel) {
        titleLabel.text = model.title
        singerLabel.text = model.singer
        albumImageView.image = UIImage(named: model.albumImage)
    }
}

