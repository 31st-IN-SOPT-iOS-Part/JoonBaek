//
//  ImagePracticeViewController.swift
//  IN_SOPT_First_Seminar
//
//  Created by hansol on 2022/10/08.
//

import UIKit

import SnapKit

// MARK: - ImagePracticeViewController

final class ImagePracticeViewController: UIViewController {
    
    // MARK: - Lazy Components
    
    private lazy var imageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray2
        return button
    }()
    
    // MARK: - UI Components
    
    private let imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    private let djImageView = UIImageView()
    
    // MARK: - Variables
    
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configButton()
        configImageView()
        layout()
    }
}

// MARK: - Extensions

extension ImagePracticeViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        [imageContainerView, imageButton].forEach {
            view.addSubview($0)
        }
        
        imageContainerView.addSubview(djImageView)
        
        imageContainerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(150)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        
        djImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageButton.snp.makeConstraints {
            $0.top.equalTo(self.imageContainerView.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(200)
            }
    }
    
    // MARK: - General Helpers
    
    private func configImageView() {
        djImageView.image = UIImage(named: "imgDJ")
    }
    
    private func configButton() {
        imageButton.setBackgroundImage(UIImage(named: "imgDJ"), for: .normal)
    }
}
