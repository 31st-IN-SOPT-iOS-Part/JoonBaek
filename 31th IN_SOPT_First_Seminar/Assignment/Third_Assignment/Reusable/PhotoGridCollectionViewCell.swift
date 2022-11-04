//
//  PhotoGridCollectionViewCell.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/27.
//

import UIKit

import Then
import SnapKit
import SwiftyColor

//MARK: - PhotoGridCollectionViewCell

final class PhotoGridCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI Components
    
    private let photoContainerView = UIView()
    private let photoImageView = UIImageView()
    
    //MARK: - Identifier
    
    static let identifier = "PhotoGridCollectionViewCell"
    
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

extension PhotoGridCollectionViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubview(photoContainerView)
        
    }
    
    //MARK: - Action Helpers
    
    func dataBind(imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }
}

