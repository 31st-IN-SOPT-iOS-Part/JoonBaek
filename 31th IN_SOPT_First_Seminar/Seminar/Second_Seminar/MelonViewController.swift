//
//  MelonViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/08.
//

import UIKit

import SnapKit
import SwiftyColor

//MARK: - MelonViewController

final class MelonViewController: UIViewController {
    
    //MARK: - Lazy Components
    
    private lazy var containerView = UIScrollView()
    
    //MARK: - UI Components
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "오늘 18:00시 기준"
        return label
    }()
    
    private let listLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.text = "멜론TOP100"
        return label
    }()
    
    private let imageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let graphImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "melon_graph")
        return imageView
    }()
    
    private let allButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(0x000000.color, for: .normal)
        button.setTitle("전체보기", for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let nowbutton: UIButton = {
        let button = UIButton()
        button.setTitleColor(0x000000.color, for: .normal)
        button.setTitle("NOW", for: .normal)
        button.backgroundColor = 0x56BC4E.color
        button.layer.cornerRadius = 14
        return button
    }()
    
    private let playlistView: UIView = {
        let view = UIView()
        view.backgroundColor = 0xD9D9D9.color
        return view
    }()
    
    private let recommendLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "목요일은 트랙제로, 전문가 추천 음악"
        return label
    }()
    
    private let djImageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let djImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "imgDJ")
        return imageview
    }()
    
    //MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}
    
    //MARK: - Extensions
    
    extension MelonViewController {
        
        //MARK: - Layout Helpers
        
        private func layout() {
            
            view.addSubview(containerView)
            
            containerView.snp.makeConstraints { make in
                make.edges.equalTo(self.view.safeAreaLayoutGuide)
            }
            
            let components: [Any] = [
                dateLabel,
                listLabel,
                graphImageView,
                allButton,
                nowbutton,
                playlistView,
                recommendLabel,
                imageContainerView
            ]
            
            components.forEach {
                containerView.addSubview($0 as! UIView)
            }
            
            dateLabel.snp.makeConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
                make.leading.equalToSuperview().offset(21)
            }
            
            listLabel.snp.makeConstraints { make in
                make.top.equalTo(listLabel.snp.bottom).offset(5)
                make.leading.equalTo(listLabel.snp.leading)
            }
            
            graphImageView.snp.makeConstraints { make in
                make.centerX.equalTo(listLabel.snp.centerX)
                make.leading.equalTo(listLabel.snp.trailing)
            }
            
            allButton.snp.makeConstraints { make in
                make.centerX.equalTo(listLabel.snp.centerX)
                make.trailing.equalToSuperview().offset(27)
            }
            
            nowbutton.snp.makeConstraints { make in
                make.top.equalTo(listLabel.snp.bottom).offset(16)
                make.leading.equalTo(listLabel.snp.leading)
                
            }
            
            playlistView.snp.makeConstraints { make in
                make.top.equalTo(nowbutton.snp.bottom).offset(15)
                make.leading.equalTo(listLabel.snp.leading)
            }
            
            recommendLabel.snp.makeConstraints { make in
                make.top.equalTo(playlistView.snp.bottom).offset(63)
                make.leading.equalTo(listLabel.snp.leading)
            }
            
            djImageContainerView.snp.makeConstraints { make in
                make.top.equalTo(recommendLabel.snp.bottom).offset(10)
                make.leading.trailing.equalToSuperview()
            }
            
            djImageContainerView.addSubview(djImageView)
            
            djImageView.snp_makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
}
    
    //        // MARK: - Navigation
    //
    //        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //        }
    
    //    }
    
    //}
