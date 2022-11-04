//
//  MusicListCollectionViewCell.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/15.
//

import UIKit

import Then
import SnapKit
import SwiftyColor

//MARK: - MusicListCollectionViewCell

final class MusicCollectionViewCell: UICollectionViewCell {
    
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
    
    //MARK: - Identifier
    
    static let identifier = "MusicListCollectionViewCell"
    
    //MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extensions

extension MusicCollectionViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [
            albumContainerView,
            titleLabel,
            singerLabel
        ].forEach {
            contentView.addSubview($0)
        }
        
        albumContainerView.addSubview(albumImageView)
        
        albumContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
//            $0.leading.equalToSuperview().offset(9)
            $0.width.height.equalTo(139)
        }
        
        albumImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(albumImageView.snp.bottom).offset(6)
            $0.leading.equalTo(albumImageView)
        }
        
        singerLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(albumImageView)
        }
    }
    //MARK: - Action Helpers
    func dataBind(model: MusicModel) {
        titleLabel.text = model.title
        singerLabel.text = model.singer
        albumImageView.image = UIImage(named: model.albumImage)
    }
}
